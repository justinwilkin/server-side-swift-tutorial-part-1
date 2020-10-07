import Vapor

func routes(_ app: Application) throws {
    
    //
    // Register an endpoint for /products
    //
    app.get(Constants.Endpoints.products.path) {
        req -> Response in
        
        // Call our product service to get our products
        let products = app.productService.getProducts()
        
        // Return a serialised list of products
        return .init(status: .ok,
                     version: req.version,
                     headers: ["Content-Type": "application/json"],
                     body: .init(string: products.codableArrayAsJsonString()))
    }
    
    //
    // Register an endpoint for /products/:productId
    //
    app.get(Constants.Endpoints.products.path, ":\(Constants.Endpoints.singleProduct.path)") {
        req -> Response in
        
        // Get our productId from the url-path parameter
        let productId = req.parameters.get(
            Constants.Endpoints.singleProduct.rawValue,
            as: Int.self
        ) ?? 0
        
        // Call our product service to get the product by id
        if let product = app.productService.getProductById(id: productId) {
            return .init(status: .ok,
                         version: req.version,
                         headers: ["Content-Type": "application/json"],
                         body: .init(string: product.asJsonString()))
        }
        
        // Return no product found
        return .init(status: .notFound,
                     version: req.version,
                     headers: ["Content-Type": "application/json"],
                     body: .init(string: "No product found."))
    }
}

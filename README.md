<!-- wp:heading -->
<h2>Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><a href="http://swift.org/" data-type="URL" data-id="http://swift.org/">Swift</a> as a language has grown from infancy quite rapidly since its release in 2014. The programming language, initially a proprietary language, was released to the community as an open-source project with version 2.2 in late December 2015. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>At the heart of the open-source language is the community's goal for the language:</p>
<!-- /wp:paragraph -->

<!-- wp:quote -->
<blockquote class="wp-block-quote"><p>To create the best available language for uses ranging from systems programming to mobile and desktop apps, scaling up to cloud services.</p><cite>Swift Language, source: http://swift.org/about/</cite></blockquote>
<!-- /wp:quote -->

<!-- wp:paragraph -->
<p><strong>So what's the big deal?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Initially Swift only supported the development of desktop and native mobile applications for devices running iOS and Mac OS. However, over the years, support for Unix based architecture and more recently official support for windows in Swift 5.3 (latest at time of writing), has enabled the development of applications and solutions in Swift to reach a much wider audience and developer base. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If you would like to read more on the port of Swift to Windows, I suggest reading through their <a href="https://swift.org/blog/swift-on-windows/" data-type="URL" data-id="https://swift.org/blog/swift-on-windows/">blog post</a> on the official Swift site. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Why Swift?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>So you may be asking, why should I be using Swift for my server-side development? Why is it any better than Java, C#, NodeJS (JS/TS), Python?</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Swift has many advantages when developing, some of these include uninitialised variable prevention, overflow checking, and automated memory management thanks to <a href="https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html">ARC</a>. As well as this, the language design and syntax promote <em>swift </em>(fast) development with high maintainability and readability. Swift being a young language, it still has a lot of ways to go and will continuously see improvements to its performance and feature base.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>You can read up on the language itself and look into the pros and cons. But one of the main advantages of building in Swift for server-side and full-stack is the reusability of code across your mobile, web, and server-side developments, this allows for the sharing of business logic, models, and validation across your project. This also enables language familiarity across your codebase to promote work in a cross-functional development team. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Another big advantage is if you are already an experienced iOS developer the transition to developing APIs and backend services for your application is seamless, with no need to learn a new language. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The transition from other languages such as JavaScript, TypeScript, Kotlin, etc. is also very simple as the language is designed for fast development and it is easy to learn, sharing a lot in common with those aforementioned </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Vapor</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Vapor is a web framework built for server-side Swift development. It's built on Apple's SwiftNIO: a non-blocking, event-driven architecture written in Swift which encourages type-safe, expressive, and protocol-oriented development. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>We will be covering Vapor in this tutorial. Vapor is one of the most used web frameworks for Swift server-side development. However, other options do exist but a lot of them are no longer supported or have died out. If you wish to explore them as well here are a couple: <strong>Kitura</strong> (IBM no longer supports this) and <strong><a href="https://perfect.org/" data-type="URL" data-id="https://perfect.org/">Perfect</a></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2>Prerequisites</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Before we dive in and get our hands dirty, you will need to have the following setup on your system:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li>Swift &gt; 5.2</li><li>IDE or Text Editor with Swift support (optional)</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2>Setting up Vapor</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>We will be installing Vapor in the next section of the tutorial using and Vapor Toolbox for CLI shortcuts, which is only available for macOS and Linux. If you are on Windows you can still use the Vapor framework but will have to manually set up your project. You can download the <a href="https://github.com/vapor/api-template">API Template</a> from Vapor's GitHub repository.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>To install the Vapor Toolbox, you can use brew or apt-get.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code># macOS
brew install vapor 

# linux
git clone https://github.com/vapor/toolbox.git
cd toolbox
git checkout &lt;desired version>
make install

# commands
vapor --help</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Now that we have Vapor installed, we can use the <span class="has-inline-color has-accent-color">vapor</span> command. Let's start by creating our project.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Out of the box, Vapor supports the use of <a href="https://docs.vapor.codes/4.0/fluent/overview/" data-type="URL" data-id="https://docs.vapor.codes/4.0/fluent/overview/">database drivers</a>, we will not be using these in the tutorial so if prompted when creating your new project to install any extra packages you can answer <strong><em>no</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>vapor new shopApi
cd shopApi
vapor build</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>We are creating a new project here named shopApi. In this tutorial, we will be creating a simple shopping app which will display a list of products available to a user. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If you would like to read more about the differences between <strong><em>dynamic link</em></strong><em><strong>ing</strong></em> and <strong><em>static linking</em></strong> you can read further at <a href="https://swift.org/package-manager/" data-type="URL" data-id="https://swift.org/package-manager/">https://swift.org/package-manager/</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The rest of the tutorial will focus on development using the macOS environment. All code snippets and Vapor CLI commands will carry across to Linux as well, however, running the application will be done through the terminal instead of through Xcode.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Running our Swift application from the command line:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>vapor build &amp;&amp; vapor run</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If you are on macOS you can run:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>vapor xcode</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This will open the project in Xcode where you can use the normal build and run buttons you are familiar with for mobile development. You can also set breakpoints inside your code to debug your application.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2>Building your first route</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>It's time to get our hands dirty. Let's start by creating our first route for our basic shopApi. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Endpoints</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>First, let us define some constants for our endpoints. Create a new Constants.swift file with the following constants.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>// Constants.swift

import Vapor

public enum Constants {
    
    public enum Endpoints: String {
        // MARK:- Shop Endpoints
        case products = "products"
        case singleProduct = "productId"
       
        var path: PathComponent {
            return PathComponent(
                stringLiteral: self.rawValue
            )
        }
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Here we define two constants for the routes we will be using. You will see later how we use the ":productId" to provide a path template for an endpoint to retrieve a single product.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Routes</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Now open the  <code>routes.swift</code>  file and replace the existing routes with a new route for the two endpoints: <strong>products</strong> and <strong>products/:productId</strong>. </p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>// routes.swift

func routes(_ app: Application) throws {
    app.get(Constants.Endpoints.products.path) { 
        req -> String in
        
        return "All Products"
    }

    app.get(Constants.Endpoints.products.path, 
            Constants.Endpoints.singleProduct.path) { 
        req -> String in
        
        return "Single Product"
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>When we define the endpoint for products/:productId, Vapor uses the colon (:) as an identifier for a URL path parameter. We can access this inside the function using the following:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>let param = req.parameters.get("productId")

or

# Using type casting
let param = req.parameters.get("productId", as: Int.self)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Now if we run the project (Run in Xcode) you should see the following:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>vapor build &amp;&amp; vapor run
  
    Building project...
    &#91;8/8] Linking Run
    Project built.
    &#91; NOTICE ] Server starting on http://127.0.0.1:8080</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Navigate in a browser or using Postman to <code>http://127.0.0.1:8080/products</code> you should see the server respond with "All products".</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Congratulations, you now have your first endpoints setup using Vapor. </p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2>Models and business logic</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Let's now explore the reusability of models and business logic across our server-side and application codebase. We discussed earlier that this is one of the main advantages of using Swift across your entire stack.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Create a new file called Product.swift in the Models folder (create this if it does not exist). </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In a real-world scenario, this would be developed as part of a common framework or module and imported into the project for code re-usability across your Swift Stack. For simplicity in this tutorial, we will not cover creating a Swift package for use in your project.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>// Product.swift

import Foundation

struct Product: Codable {
    // MARK:- Properties
    private var id: Int
    private var name: String
    private var price: Double
    private var description: String
    
    // MARK:- Lifecycle
    init(id: Int, name: String, 
         price: Double, description: String) {
        self.id = id
        self.name = name
        self.price = price
        self.description = description
    }
    
    // MARK:- Codeable Methods
    func asJsonString() -> String {
        let codedProduct = try! JSONEncoder().encode(self)
        return String(data: codedProduct, encoding: .utf8)!
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>In this product model file, we create a basic data structure for our products and conform it to the Codable type. This allows us to serialise our object both in our server-side and client-side applications.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>We also have an instance helper method here to serialise our codeable product to a string for passing as a response body.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This Product model will now be useable in both our server-side and client-side applications, and any changes that are made to this data structure in our common framework will be reflected across both applications, reducing the development effort when updating and ensuring alignment between client and server. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Services</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Services in Vapor can be registered as a part of the application to act as the business logic layer. Now that we have created our model for the shop, let's create a service which will serve some dummy products for our shop. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Create a new file called ProductService.swift inside a Services folder (Create this folder if it does not exist).</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>// ProductService.swift

import Foundation
import Vapor

class ProductService {
    var products: &#91;Product] = &#91;]
    
    //
    // Initialise our products.
    // This is a mock that returns hard coded products
    //
    init() {
        // Create some dummy products
        let toucan = Product(
            id: 1,
            name: "Toucan",
            price: 50.00,
            description: "Famous bird of the zoo"
        )
        
        let elephant = Product(
            id: 2,
            name: "Elephant",
            price: 85.00,
            description: "Large creature from Africa"
        )
        
        let giraffe = Product(
            id: 3,
            name: "Giraffe",
            price: 65.00,
            description: "Long necked creature"
        )
        
        // Add them to our products array
        products.append(toucan)
        products.append(elephant)
        products.append(giraffe)
    }
    
    //
    // Filter our products array and get by matching id
    //
    func getProductById(id: Int) -> Product? {
        return products.first(where: { $0.id == id })
    }
    
    //
    // Return all products
    //
    func getProducts() -> &#91;Product] {
        return products
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>In this simple service, we are instantiating 3 products and storing them in our products array. This logic in practice would be replaced with a database implementation to store and access our products. However, for now, we are just hardcoding the values stored in our shop.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>There are two methods in this service, one which we will use to return all the products that our store contains, and the other to return a product by its ID. These two methods match up with our current routes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><br><strong>Registering our service</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Now to access our service from our routes or controllers, we must register them in the Vapor application. To do this let's add this extension to the bottom of our ProductService.swift file.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>// MARK:- Services implementation
extension Application {
    
    //
    // Register our product service with the Vapor     
    // application. 
    // 
    var productService: ProductService {
        .init()
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>In Vapor 4, you now register your services as extensions of either the Application or Request objects. This exposes the services as properties and allows for easier use in our routes and controllers.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This allows us to use our ProductService methods by calling:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>app.productService.getProducts()</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><strong>Codable Extension</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Lastly, before we hook everything up and can start responding with products for our API, we must write an extension to serialise the list of our products to a JSON string. Open the Product.swift file and at the end of the file add the following extension.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>// Product.swift

struct Product: Codable {
...
...
}

extension Array {
    typealias CodableArray = &#91;Product]
    
    //
    // Encode our array as a Json string.
    //
    func codableArrayAsJsonString() -> String {
        if let array = self as? CodableArray {
            let codedArray = try! 
                JSONEncoder().encode(array)

            return String(
                data: codedArray, 
                encoding: .utf8
           )!
        }
        
        // This is where we can add some error handling,
        // But for now we will just return blank
        return ""
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This extension allows us to encode a list of our products to a JSON string for use as the body in a response object.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2>Putting it all together</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Now that we have built our business logic and models, we can now start responding to our client with the products our shop offers. Let's open the routes.swift file again and modify our /products route.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>All Products Route</strong></p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>//
// Register an endpoint for /products
//
app.get(Constants.Endpoints.products.path) {
    req -> Response in
        
    // Call our product service to get our products
    let products = app.productService.getProducts()
        
    // Return a serialised list of products
    return .init(status: .ok,
             version: req.version,
             headers: &#91;
               "Content-Type": 
               "text/json; charset=utf-8"
             ],
             body: 
               .init(string:
                  products.codableArrayAsJsonString()
               ))
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Here we are calling our service that we registered earlier on our application object, and retrieving the list of products our shop offers.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>We are then creating a response object which will return the encoded JSON list of our products in the body using our extension: <code>codableArrayAsJsonString()</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Single Product Route</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Let's add modify our final route, which takes in a url-path parameter for the productId and returns the product if it is found.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>//
// Register an endpoint for /products/:productId
//
app.get(Constants.Endpoints.products.path, 
        ":\(Constants.Endpoints.singleProduct.path)"
    ) {
    req -> Response in
        
    // Get our productId from the url-path parameter
    let productId = req.parameters.get(
        Constants.Endpoints.singleProduct.rawValue,
        as: Int.self
    ) ?? 0
        
    // Call our product service to get the product by id
    if let product =
       app.productService.getProductById(id: productId) {
            return .init(status: .ok,
                     version: req.version,
                     headers: &#91;
                       "Content-Type": 
                       "text/json; charset=utf-8"],
                     body: 
                      .init(
                        string: product.asJsonString()
                      ))
    }
        
    // Return no product found
    return .init(status: .ok,
             version: req.version,
             headers: &#91;
               "Content-Type": 
               "text/json; charset=utf-8"
             ],
             body: .init(string: "No product found."))
    }</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Here we get the productId from the url-path of the request and use it to call our service with the <code>.getProductById()</code> method. This returns a single product matching the ID. We then encode the product as a JSON String and set it as the response body.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If no product is found we return a 404 Product not found.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2>Running the application</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Finally, let's run our application to see our API in its finished state. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If you call the <code>http://127.0.0.1:8080/products</code> endpoint you should now see the following response:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&#91;
   {
      "id":1,
      "name":"Toucan",
      "price":50,
      "description":"Famous bird of the zoo"
   },
   {
      "id":2,
      "name":"Elephant",
      "price":85,
      "description":"Large creature from Africa"
   },
   {
      "id":3,
      "name":"Giraffe",
      "price":65,
      "description":"Long necked creature"
   }
]</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Now, now if you call the single product endpoint with a product id </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><code>http://127.0.0.1:8080/products/:productId</code></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For example: <code>/products/1</code> you should see the following response:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>{
   "id":1,
   "name":"Toucan",
   "price":50,
   "description":"Famous bird of the zoo"
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Congratulations, you now have a simple products API built entirely in Swift. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><br><em>Next:</em> <strong>Swift Stack: Swift Frontend using SwiftWebUI and Server-Side Swift (Part Two)</strong><br>In the next part, we will look at building a web frontend for our shop, again using Swift and the <a href="https://github.com/SwiftWebUI/SwiftWebUI" data-type="URL" data-id="https://github.com/SwiftWebUI/SwiftWebUI">SwiftWebUI</a> framework. We will be consuming these APIs for displaying our products in our application.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->
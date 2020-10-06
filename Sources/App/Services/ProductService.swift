//
//  ProductService.swift
//  
//
//  Created by Justin Wilkin on 6/10/20.
//

import Foundation
import Vapor

class ProductService {
    var products: [Product] = []
    
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
    func getProducts() -> [Product] {
        return products
    }
}

// MARK:- Services implementation
extension Application {
    
    //
    // Register our product service with the Vapor application
    // In Vapor 4 this is now registered so you can access it inside the
    // Application object for ease of use.
    //
    var productService: ProductService {
        .init()
    }
}

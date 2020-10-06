//
//  Product.swift
//  
//
//  Created by Justin Wilkin on 6/10/20.
//

import Foundation

struct Product: Codable {
    // MARK:- Properties
    private(set) var id: Int
    private var name: String
    private var price: Double
    private var description: String
    
    // MARK:- Lifecycle
    init(id: Int, name: String, price: Double, description: String) {
        self.id = id
        self.name = name
        self.price = price
        self.description = description
    }
    
    // MARK:- Codeable methods
    func asJsonString() -> String {
        let codedProduct = try! JSONEncoder().encode(self)
        return String(data: codedProduct, encoding: .utf8)!
    }
}

extension Array {
    typealias CodableProductsArray = [Product]
    
    //
    // Encode our array as a Json string.
    //
    func codableArrayAsJsonString() -> String {
        if let array = self as? CodableProductsArray {
            let codedArray = try! JSONEncoder().encode(array)
            return String(data: codedArray, encoding: .utf8)!
        }
        
        return ""
    }
}


//
//  Constants.swift
//  
//
//  Created by Justin Wilkin on 6/10/20.
//

import Vapor

public enum Constants {
    
    public enum Endpoints: String {
        // MARK:- Shop Endpoints
        case products = "products"
        case singleProduct = "productId"
        
        var path: PathComponent {
            return PathComponent(stringLiteral: self.rawValue)
        }
    }
    
}

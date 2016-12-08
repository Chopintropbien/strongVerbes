//
//  Products.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 25/11/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import Foundation

public struct Products {
    
    public static let A2ProductId = "Irregular.german.verbs.accessA2Level"
    public static let B1ProductId = "Irregular.german.verbs.accessB1Level"
    public static let B2ProductId = "Irregular.german.verbs.accessB2Level"
    public static let C1ProductId = "Irregular.german.verbs.accessC1Level"
    public static let AllProductId = "Irregular.german.verbs.accessAllLevel"
    
    fileprivate static let productIdentifiers: Set<ProductIdentifier> =
        [Products.A2ProductId, Products.AllProductId, Products.B1ProductId, Products.B2ProductId, Products.C1ProductId]
    
    public static let store = IAPHelper(productIds: Products.productIdentifiers)
    
    public static func nbProduct() -> Int{
        return productIdentifiers.count
    }
    public static func productId(level: Level) -> String{
        switch(level){
        case Level.A2:
            return A2ProductId
        case Level.B1:
            return B1ProductId
        case Level.B2:
            return B2ProductId
        case Level.C1:
            return C1ProductId
        default:
            return AllProductId
        }
    }
}

func resourceNameForProductIdentifier(_ productIdentifier: String) -> String? {
    return productIdentifier.components(separatedBy: ".").last
}

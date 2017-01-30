//
//  Products.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 25/11/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import Foundation
import StoreKit

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
    
    public static func isLevelPurchased(products: [SKProduct], level: Level) -> Bool{
        if(products.isEmpty){
            return isLevelPurchasedProductCheck(products: products, level: level)
        }
        else{
            return isLevelPurchasedUserDefaultsCheck(level: level)
        }
    }
    
    
    public static func isLevelPurchasedUserDefaultsCheck(level: Level) -> Bool{
        if(Products.isA2B1B2C1ArePurchasedUserDefaultsCheck()){
            return true
        }
        else if(UserDefaults.standard.bool(forKey: productId(level: level)) ||
            UserDefaults.standard.bool(forKey: productId(level: Level.All))){
            return true
        }
        else {
            return false
        }
    }
    public static func isA2B1B2C1ArePurchasedUserDefaultsCheck() -> Bool{
        var purchased = true
        for productIdentifier in productIdentifiers {
            if(productIdentifier != Products.AllProductId){
                purchased = purchased && UserDefaults.standard.bool(forKey: productIdentifier)
            }
        }
        return purchased
    }
    
    
    
    public static func isLevelPurchasedProductCheck(products: [SKProduct], level: Level) -> Bool{
        if(Products.isA2B1B2C1ArePurchasedProductCheck(products: products)){
            return true
        }
        else if(Products.store.isProductPurchased(Products.productId(level: level)) ||
            Products.store.isProductPurchased(Products.productId(level: Level.All))){
            return true
        }
        else {
            return false
        }
    }
    
    public static func isA2B1B2C1ArePurchasedProductCheck(products: [SKProduct]) -> Bool{
        var arePurchased = !products.isEmpty;
        for p in products{
            if(p.productIdentifier != Products.AllProductId){
                
                arePurchased = arePurchased && Products.store.isProductPurchased(p.productIdentifier)
            }
        }
        return arePurchased
    }
    
    
    
    
    public static func findProduct(products: [SKProduct], id: String) -> SKProduct{
        return products.filter({$0.productIdentifier == id}).first!
    }
    
}

func resourceNameForProductIdentifier(_ productIdentifier: String) -> String? {
    return productIdentifier.components(separatedBy: ".").last
}

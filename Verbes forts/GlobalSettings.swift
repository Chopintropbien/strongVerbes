//
//  GlobalSettings.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 27/09/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import Foundation
import UIKit

var sounds = true


let pink = UIColor(red: 246/255.0, green: 47/255.0, blue: 94/255.0, alpha: 1)
let darkPink = UIColor(red: 217/255.0, green: 43/255.0, blue: 83/255.0, alpha: 1)
let fontColor = UIColor(red: 46/255.0, green: 46/255.0, blue: 46/255.0, alpha: 1)
let fontColorLight = UIColor(red: 60/255.0, green: 60/255.0, blue: 60/255.0, alpha: 1)
let darkGray = UIColor(red: 100/255.0, green: 100/255.0, blue: 100/255.0, alpha: 1)
let gray = UIColor(red: 155/255.0, green: 155/255.0, blue: 155/255.0, alpha: 1)
let lightGray = UIColor(red: 215/255.0, green: 215/255.0, blue: 215/255.0, alpha: 1)
let cream = UIColor(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1)
let almostWhite = UIColor(red: 254/255.0, green: 254/255.0, blue: 254/255.0, alpha: 1)

let defaultBlue = UIColor(red: 14.0/255.0, green: 122.0/255.0, blue: 254.0/255.0, alpha: 1)
let basicBackgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1)
let freeColor = UIColor(red: 246/255.0, green: 87/255.0, blue: 122/255.0, alpha: 1)
//let freeColor = UIColor(red: 230/255.0, green: 190/255.0, blue: 210/255.0, alpha: 1)



class Setting {
    
    static fileprivate let userDefaults = UserDefaults.standard
    static private let numberRamdomKey = "kNumberRamdomDefaultKey"
    static private let numberLectureKey = "kNumberLectureDefaultKey"
    
    
    
    static public func numberRandom(nbRand: Int){
        Setting.userDefaults.setValue(nbRand, forKey: numberRamdomKey)
        Setting.userDefaults.synchronize()
    }
    static public func numberRandom() -> Int{
        if let nbRand = userDefaults.object(forKey: numberRamdomKey) as? Int {
            return nbRand
        }
        else{
            return 15
        }
    }
    
    static public func numberLecture(nbLect: Int){
        userDefaults.setValue(nbLect, forKey: numberLectureKey)
        userDefaults.synchronize()
    }
    static public func numberLecture() -> Int{
        if let nbLect = userDefaults.object(forKey: numberLectureKey) as? Int {
            return nbLect
        }
        else{
            return 1
        }
    }
    
    
    
}



// where? RageProducts.store.restorePurchases()



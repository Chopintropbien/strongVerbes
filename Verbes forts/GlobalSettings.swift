//
//  GlobalSettings.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 27/09/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import Foundation
import UIKit



struct Global{
    static fileprivate let langKey = "lang"
    static fileprivate let defaultLang = Lang.fr
    
    static func changeLang(_ l: Lang){
        UserDefaults.standard.set(l.rawValue, forKey: langKey)
        UserDefaults.standard.synchronize()
        displaidWords = DisplayWords(lang: l)
    }
    
    static func getLang() -> Lang{
        if let key = UserDefaults.standard.string(forKey: langKey){
            print("coucou: \(key)")
            return Lang(rawValue: key)!
        }
        else{
            return defaultLang
        }
    }
}

var sounds = true
var displaidWords = DisplayWords(lang: Global.getLang())



let pink = UIColor(red: 246/255.0, green: 47/255.0, blue: 94/255.0, alpha: 1)
let fontColor = UIColor(red: 46/255.0, green: 46/255.0, blue: 46/255.0, alpha: 1)
let fontColorLight = UIColor(red: 60/255.0, green: 60/255.0, blue: 60/255.0, alpha: 1)
let gray = UIColor(red: 155/255.0, green: 155/255.0, blue: 155/255.0, alpha: 1)
let lightGray = UIColor(red: 215/255.0, green: 215/255.0, blue: 215/255.0, alpha: 1)
let cream = UIColor(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1)
let almostWhite = UIColor(red: 254/255.0, green: 254/255.0, blue: 254/255.0, alpha: 1)



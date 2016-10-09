//
//  GlobalSettings.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 27/09/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import Foundation
import UIKit


private var lang = Lang.fr

func changeLang(l: Lang){
    lang = l
    displaidWords = DisplayWords(lang: l)
    
}

func getLang() -> Lang{
    return lang
}
var sounds = true

var displaidWords = DisplayWords(lang: Lang.fr)



let pink = UIColor(red: 246/255.0, green: 47/255.0, blue: 94/255.0, alpha: 1)
let fontColor = UIColor(red: 46/255.0, green: 46/255.0, blue: 46/255.0, alpha: 1)
let fontColorLight = UIColor(red: 60/255.0, green: 60/255.0, blue: 60/255.0, alpha: 1)
let gray = UIColor(red: 155/255.0, green: 155/255.0, blue: 155/255.0, alpha: 1)


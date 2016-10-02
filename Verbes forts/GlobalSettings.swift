//
//  GlobalSettings.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 27/09/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import Foundation


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


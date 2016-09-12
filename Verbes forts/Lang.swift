//
//  Lang.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 12/09/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import Foundation

let langSetting = Lang.en

enum Lang{
    case fr
    case en
}

class DisplayWords{
    
    private let lang: Lang
    
    init(lang: Lang){
        self.lang = lang
    }
    
    /* Common */
    
    func unclassable()-> String {
        switch lang {
        case Lang.fr:
            return "inclassable"
        case Lang.en:
            return "unclassifiable"
        }
    }
    
    func weakIregularMasculin()-> String {
        switch lang {
        case Lang.fr:
            return "faible irrégulier"
        case Lang.en:
            return "weak-irregular"
        }
    }
    
    func weakIregularFeminin()-> String {
        switch lang {
        case Lang.fr:
            return "faible irrégulière"
        case Lang.en:
            return "weak-irregular"
        }
    }
    
    func next()-> String {
        switch lang {
        case Lang.fr:
            return "Suivant"
        case Lang.en:
            return "Next"
        }
    }
    
    /*ChooseVerbes*/
    
    func titleChooseVerbes()-> String {
        switch lang {
        case Lang.fr:
            return "Les vebes forts"
        case Lang.en:
            return "German irregular verbs"
        }
    }
    
    
    func randomOrder()-> String {
        switch lang {
        case Lang.fr:
            return "Ordre aléatoire"
        case Lang.en:
            return "Random order"
        }
    }
    
    func formOrderLabel()-> String {
        switch lang {
        case Lang.fr:
            return "Classés celon la forme:"
        case Lang.en:
            return "Classified by form"
        }
    }
    
    func alphabeticOrderLabel()-> String {
        switch lang {
        case Lang.fr:
            return "Classés par ordre alphabétique"
        case Lang.en:
            return "Classified by alphabetical order"
        }
    }
    
    
    
    
    
    
    /*ChooseVerbes*/
    
    func headerTextRandom(numberVerbe: Int) -> String{
        switch lang {
        case Lang.fr:
            return "Essayer de vous souvenir de ses " + String(numberVerbe) + " verbes"
        case Lang.en:
            return "Try to remember this " + String(numberVerbe) + " verbes"
        }
    }
    
    func hereVerbesWithForm(form: String) -> String{
        switch lang {
        case Lang.fr:
            return "Voici les verbes forts allemand de forme " + form + " mots"
        case Lang.en:
            return "Here are german irregular verbs who works like: " + form
        }
    }
    
    func hereVerbesWhoBeginBuy(letter: LetterButton) -> String{
        switch lang {
        case Lang.fr:
            return "Voici les verbes forts allemand commençant par " + letter.rawValue.uppercaseString
        case Lang.en:
            return "Here are german irregular verbs who begins buy: " + letter.rawValue.uppercaseString
        }
    }
    
    
    
    
}
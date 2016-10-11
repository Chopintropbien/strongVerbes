//
//  Lang.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 12/09/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import Foundation


enum Lang: String{
    case fr = "Français"
    case en = "English"
    case es = "Español"
    case ru = "Russe"
}

class DisplayWords{
    
    fileprivate let lang: Lang
    
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
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
        
    }

    func weakIregularMasculin()-> String {
        switch lang {
        case Lang.fr:
            return "faible irrégulier"
        case Lang.en:
            return "weak-irregular"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    func weakIregularFeminin()-> String {
        switch lang {
        case Lang.fr:
            return "faible irrégulière"
        case Lang.en:
            return "weak-irregular"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    func next()-> String {
        switch lang {
        case Lang.fr:
            return "Suivant"
        case Lang.en:
            return "Next"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    func select()-> String {
        switch lang {
        case Lang.fr:
            return "SELECT" //"SELECTIONNER" -> to big
        case Lang.en:
            return "SELECT"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    /*ChooseLevel*/
    func selectLevel()-> String {
        switch lang {
        case Lang.fr:
            return "Choisissez votre niveau"
        case Lang.en:
            return "Choose your level"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    func allLevel()-> String {
        switch lang {
        case Lang.fr:
            return "Tous"
        case Lang.en:
            return "All"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    
    func A2LevelExplaination()-> String {
        switch lang {
        case Lang.fr:
            return "Niveau Elémentaire"
        case Lang.en:
            return "Basic Level"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    func B1B2LevelExplaination()-> String {
        switch lang {
        case Lang.fr:
            return "Niveau Intermédiare"
        case Lang.en:
            return "Intermediate Level"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    func C1LevelExplaination()-> String {
        switch lang {
        case Lang.fr:
            return "Niveau avancé"
        case Lang.en:
            return "Advanced Level"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    func allLevelExplaination()-> String {
        switch lang {
        case Lang.fr:
            return "Tous niveaux"
        case Lang.en:
            return "Every Level"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    
    
    
    
    /*ChooseVerbes*/
    
    func titleChooseVerbes()-> String {
        switch lang {
        case Lang.fr:
            return "Les verbes forts"
        case Lang.en:
            return "Irregular verbs"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    func randomOrderButton()-> String {
        switch lang {
        case Lang.fr:
            return "Aléatoire"
        case Lang.en:
            return "Random"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    
    func randomOrderLabel()-> String {
        switch lang {
        case Lang.fr:
            return "Ordre aléatoire"
        case Lang.en:
            return "Random order"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    func formOrderLabel()-> String {
        switch lang {
        case Lang.fr:
            return "Classés celon la forme:"
        case Lang.en:
            return "Classified by form"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    func alphabeticOrderLabel()-> String {
        switch lang {
        case Lang.fr:
            return "Classés par ordre alphabétique"
        case Lang.en:
            return "Classified by alphabetical order"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    
    
    
    
    
    /*ChooseVerbes*/
    
    func headerTextRandom(_ numberVerbe: Int) -> String{
        switch lang {
        case Lang.fr:
            return "Essayer de vous souvenir de ces " + String(numberVerbe) + " verbes"
        case Lang.en:
            return "Try to remember this " + String(numberVerbe) + " verbes"
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    func hereVerbesWithForm(_ form: String) -> String{
        switch lang {
        case Lang.fr:
            return "Voici les verbes forts allemand de forme " + form
        case Lang.en:
            return "Here are german irregular verbs who works like: " + form
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    func hereVerbesWhoBeginBuy(_ letter: LetterButton) -> String{
        switch lang {
        case Lang.fr:
            return "Voici les verbes forts allemand commençant par " + letter.rawValue.uppercased()
        case Lang.en:
            return "Here are german irregular verbs who begins buy: " + letter.rawValue.uppercased()
        case Lang.es:
            return ""
        case Lang.ru:
            return ""
        }
    }
    
    
    
    
}

//
//  Lang.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 12/09/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import Foundation

class DisplayWords{    
    /* Common */
    
    func unclassable()-> String {
        return Localization("unclassifiable")
    }

    func weakIregularMasculin()-> String {
        return Localization("weak-irregular-masculin")
    }
    
    func weakIregularFeminin()-> String {
        return Localization("weak-irregular-feminin")
    }
    
    func next()-> String {
        return Localization("Next")
    }
    
    func select()-> String {
        return Localization("SELECT") //"SELECTIONNER" -> to big
    }
    
    /*ChooseLevel*/
    func selectLevel()-> String {
        return Localization("Choose your level")
    }
    
    func allLevel()-> String {
        return Localization("All")
    }
    
    
    func A2LevelExplaination()-> String {
        return Localization("Basic Level")
    }
    
    func B1B2LevelExplaination()-> String {
        return Localization("Intermediate Level")
    }
    
    func C1LevelExplaination()-> String {
        return Localization("Advanced Level")
    }
    
    func allLevelExplaination()-> String {
        return Localization("Every Level")
    }
    
    
    
    
    
    /*ChooseVerbes*/
    
    func titleChooseVerbes()-> String {
        return Localization("Irregular verbs")
    }
    
    func randomOrderButton()-> String {
        return Localization("Random")
    }
    
    
    func randomOrderLabel()-> String {
        return Localization("Random order")
    }
    
    func formOrderLabel()-> String {
        return Localization("Classified by form")
    }
    
    func alphabeticOrderLabel()-> String {
        return Localization("Classified by alphabetical order")
    }
    
    
    
    
    
    
    /*ChooseVerbes*/
    
    func headerTextRandom(_ numberVerbe: Int) -> String{
        return Localization("Try to remember this ") + String(numberVerbe) + Localization(" verbes")
    }
    
    func hereVerbesWithForm(_ form: String) -> String{
        return Localization("Here are german irregular verbs who works like: ") + form
    }
    func hereVerbesWithFormWeak() -> String{
        return Localization("Here are german irregular verbs by form: weak-irregular")
    }
    func hereVerbesWithFormUndefine() -> String{
        return Localization("Here are german irregular verbs by form: unclassifiable")
    }
    
    func hereVerbesWhoBeginBuy(_ letter: LetterButton) -> String{
        return Localization("Here are german irregular verbs who begins buy: ") + letter.rawValue.uppercased()
    }
 
    
}

//
//  ChooseLevel.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 27/09/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//



import UIKit

class ChooseLevel: UIViewController, ENSideMenuDelegate {
    
    
    @IBOutlet weak var selectLevelLabel: UILabel!
    
    @IBOutlet weak var allLevelButton: UIButton!
    
    override func viewDidLoad() {
        self.title = displaidWords.titleChooseVerbes()
        selectLevelLabel.text = displaidWords.selectLevel()
        allLevelButton.setTitle(displaidWords.allLevel(), forState: .Normal) 
    }
    
    
    @IBAction func showLanguageMenu(sender: UIBarButtonItem) {
        toggleSideMenuView()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cv = segue.destinationViewController as? ChooseVerbes{
            if let id = segue.identifier{
                switch id {
                case Level.A2.rawValue:
                    cv.level = Level.A2
                case Level.B1.rawValue:
                    cv.level = Level.B1
                case Level.B2.rawValue:
                    cv.level = Level.B2
                case Level.C1.rawValue:
                    cv.level = Level.C1
                case Level.C2.rawValue:
                    cv.level = Level.C2
                default:
                    cv.level = Level.All
                }
            }
        }
    }
}

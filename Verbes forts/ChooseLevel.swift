//
//  ChooseLevel.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 27/09/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//



import UIKit

class ChooseLevel: UIViewController {
    
    
    @IBOutlet weak var selectLevelLabel: UILabel!
    
    @IBOutlet weak var allLevelButton: LevelButton!
    @IBOutlet weak var A2LevelButton: LevelButton!
    @IBOutlet weak var B1LevelButton: LevelButton!
    @IBOutlet weak var B2LevelButton: LevelButton!
    @IBOutlet weak var C1LevelButton: LevelButton!
    
    override func viewDidLoad() {
        setText()
        placeElement()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setText()
        super.viewWillAppear(animated)
    }
    
    public func setText(){
        // Set text in the choosed language
        self.title = Localization("Irregular verbs")
        selectLevelLabel.text = Localization("Choose your level")
        
        A2LevelButton.level = Level.A2
        B1LevelButton.level = Level.B1
        B2LevelButton.level = Level.B2
        C1LevelButton.level = Level.C1
        allLevelButton.level = Level.All
        
        A2LevelButton.setText()
        B1LevelButton.setText()
        B2LevelButton.setText()
        C1LevelButton.setText()
        allLevelButton.setText()
    }
    
    
    
    
    // get proportion from design: https://app.sympli.io/app#!/
    func placeElement(){
        
        
        
        let screenHeight = view.bounds.size.height
        let screenWidth = view.bounds.size.width
        let navigationBarHeight = self.navigationController!.navigationBar.frame.height
        
        // size in pixel from the model
        let designHeight: CGFloat = 1334.0
        let designWidth: CGFloat = 750.0
        
        // helper function for computer the proportions
        func height(_ h: Double) -> CGFloat{
            return screenHeight * (CGFloat(h)/designHeight)
        }
        func width(_ w: Double) -> CGFloat{
            return screenWidth * (CGFloat(w)/designWidth)
        }
        
        
        let buttonHeight = height(229)
        let buttonWidth = width(264)
        
        let marginTop = height(344)
        let marginRight = width(84)
        let marginBetween = width(52)
        

        A2LevelButton.setUp(frame: CGRect(x: marginRight, y: marginTop, width: buttonWidth, height: buttonHeight))
        B1LevelButton.setUp(frame: CGRect(x: marginRight + buttonWidth + marginBetween, y: marginTop, width: buttonWidth, height: buttonHeight))
        B2LevelButton.setUp(frame: CGRect(x: marginRight, y: marginTop + buttonHeight + marginBetween, width: buttonWidth, height: buttonHeight))
        C1LevelButton.setUp(frame: CGRect(x: marginRight + buttonWidth + marginBetween, y: marginTop + buttonHeight + marginBetween, width: buttonWidth, height: buttonHeight))
        allLevelButton.setUp(frame: CGRect(x: screenWidth/2 - buttonWidth/2, y: marginTop + buttonHeight*2 + marginBetween*2, width: buttonWidth, height: buttonHeight))

        selectLevelLabel.layer.frame = CGRect(x: 0, y: (marginTop + navigationBarHeight)/2, width: screenWidth, height: height(50))
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cv = segue.destination as? ChooseVerbes{
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
                default:
                    cv.level = Level.All
                }
            }
        }
    }
}

//
//  LevelButton.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 05/10/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import UIKit


@IBDesignable
class LevelButton: UIButton {
    let basicBackgroundColor: UIColor = UIColor.white
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        let buttonHeigth = self.bounds.size.height
        let buttonWidth = self.bounds.size.width
        

        self.backgroundColor = basicBackgroundColor
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = lightGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.white.cgColor
//        self.layer.shadowRadius = 20
        
        
        // Level
        let heightLevelLabel = height(43)
        let marginTopLevelLabel = height(30)
        let levelLabel = UILabel(frame: CGRect(x: 0, y: marginTopLevelLabel, width: buttonWidth, height: heightLevelLabel))
        levelLabel.text = self.titleLabel!.text
        levelLabel.textAlignment = .center
        levelLabel.font = UIFont(name: "Avenir-Black", size: height(44))
        levelLabel.textColor = fontColor
        self.addSubview(levelLabel)
        self.titleLabel!.text = ""
        
        
        
        // Level explaination
        let levelExplainLabel = UILabel(frame: CGRect(x: 0, y: marginTopLevelLabel + heightLevelLabel + height(9), width: buttonWidth, height: height(30)))
        switch levelLabel.text! {
        case "A2":
            levelExplainLabel.text = displaidWords.A2LevelExplaination()
        case "B1":
            levelExplainLabel.text = displaidWords.B1B2LevelExplaination()
        case "B2":
            levelExplainLabel.text = displaidWords.B1B2LevelExplaination()
        case "C1":
            levelExplainLabel.text = displaidWords.C1LevelExplaination()
        default:
            levelExplainLabel.text = displaidWords.allLevelExplaination()
        }
        levelExplainLabel.font = UIFont(name: "Avenir-Heavy", size: height(25))
        levelExplainLabel.textAlignment = .center
        levelExplainLabel.textColor = fontColorLight
        self.addSubview(levelExplainLabel)
        
        
        
        // Selected Button
        let selectedLabel = UILabel(frame: CGRect(x: width(47), y: height(165), width: buttonWidth-2*width(47), height: height(44)))
        selectedLabel.backgroundColor = pink
        selectedLabel.text = displaidWords.select()
        selectedLabel.textColor = UIColor.white
        selectedLabel.textAlignment = .center
        selectedLabel.font = UIFont(name: "Avenir-Heavy", size: height(28))
        selectedLabel.layer.borderColor = UIColor(red: 216/255.0, green: 216/255.0, blue: 216/255.0, alpha: 1).cgColor
        selectedLabel.layer.masksToBounds = true
        selectedLabel.layer.cornerRadius = 7
        selectedLabel.layer.shadowRadius = 5
        selectedLabel.layer.shadowColor = UIColor.gray.cgColor
        selectedLabel.layer.shadowOpacity = 0.5
        
        selectedLabel.layer.shadowOffset = CGSize.init(width: 4, height: 4)
        self.addSubview(selectedLabel)
        
        
    }
    
    
    // helper function for computer the proportions
    fileprivate func height(_ h: Double) -> CGFloat{
        let buttonHeigth = self.bounds.size.height
        let designHeight: CGFloat = 229

        return buttonHeigth * (CGFloat(h)/designHeight)
    }
    fileprivate func width(_ w: Double) -> CGFloat{
        let buttonWidth = self.bounds.size.height
        let designWidth: CGFloat = 264
        
        return buttonWidth * (CGFloat(w)/designWidth)
    }

    
    

}

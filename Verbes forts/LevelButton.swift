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
    let basicBackgroundColor: UIColor = UIColor.whiteColor()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        let buttonHeigth = self.bounds.size.height
        let buttonWidth = self.bounds.size.width
        

        self.backgroundColor = basicBackgroundColor
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = lightGray.CGColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.whiteColor().CGColor
//        self.layer.shadowRadius = 20
        
        
        // Level
        let heightLevelLabel = height(43)
        let marginTopLevelLabel = height(30)
        let levelLabel = UILabel(frame: CGRectMake(0, marginTopLevelLabel, buttonWidth, heightLevelLabel))
        levelLabel.text = self.titleLabel!.text
        levelLabel.textAlignment = .Center
        levelLabel.font = UIFont(name: "Avenir-Black", size: height(44))
        levelLabel.textColor = fontColor
        self.addSubview(levelLabel)
        self.titleLabel!.text = ""
        
        
        
        // Level explaination
        let levelExplainLabel = UILabel(frame: CGRectMake(0, marginTopLevelLabel + heightLevelLabel + height(9), buttonWidth, height(30)))
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
        levelExplainLabel.textAlignment = .Center
        levelExplainLabel.textColor = fontColorLight
        self.addSubview(levelExplainLabel)
        
        
        
        // Selected Button
        let selectedLabel = UILabel(frame: CGRectMake(width(47), height(165), buttonWidth-2*width(47), height(44)))
        selectedLabel.backgroundColor = pink
        selectedLabel.text = displaidWords.select()
        selectedLabel.textColor = UIColor.whiteColor()
        selectedLabel.textAlignment = .Center
        selectedLabel.font = UIFont(name: "Avenir-Heavy", size: height(28))
        selectedLabel.layer.borderColor = UIColor(red: 216/255.0, green: 216/255.0, blue: 216/255.0, alpha: 1).CGColor
        selectedLabel.layer.masksToBounds = true
        selectedLabel.layer.cornerRadius = 7
        selectedLabel.layer.shadowRadius = 5
        selectedLabel.layer.shadowColor = UIColor.grayColor().CGColor
        selectedLabel.layer.shadowOpacity = 0.5
        
        selectedLabel.layer.shadowOffset = CGSize.init(width: 4, height: 4)
        self.addSubview(selectedLabel)
        
        
    }
    
    
    // helper function for computer the proportions
    private func height(h: Double) -> CGFloat{
        let buttonHeigth = self.bounds.size.height
        let designHeight: CGFloat = 229

        return buttonHeigth * (CGFloat(h)/designHeight)
    }
    private func width(w: Double) -> CGFloat{
        let buttonWidth = self.bounds.size.height
        let designWidth: CGFloat = 264
        
        return buttonWidth * (CGFloat(w)/designWidth)
    }

    
    

}

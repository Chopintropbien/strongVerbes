//
//  LevelButton.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 05/10/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import UIKit


@IBDesignable
class LevelButton: SelectPlusExplainButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
//        let buttonHeigth = self.bounds.size.height
        let buttonWidth = self.bounds.size.width
        

        // Level explaination
        let heightLevelLabel = height(43)
        let marginTopLevelLabel = height(30)
        let levelExplainLabel = UILabel(frame: CGRect(x: 0, y: marginTopLevelLabel + heightLevelLabel + height(9), width: buttonWidth, height: height(30)))
        switch self.titleLabel!.text! {
        case "A2":
            levelExplainLabel.text = Localization("Basic Level")
        case "B1":
            levelExplainLabel.text = Localization("Intermediate Level")
        case "B2":
            levelExplainLabel.text = Localization("Intermediate Level")
        case "C1":
            levelExplainLabel.text = Localization("Advanced Level")
        default:
            levelExplainLabel.text = Localization("Every Level")
        }
        levelExplainLabel.font = UIFont(name: "Avenir-Heavy", size: super.height(25))
        levelExplainLabel.textAlignment = .center
        levelExplainLabel.textColor = fontColorLight
        self.addSubview(levelExplainLabel)
        
        self.titleLabel!.text = ""
        
        
    }
    
 

}

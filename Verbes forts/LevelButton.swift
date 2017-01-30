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
    private var levelExplainLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func setText(){
        if let l = level {
            switch l {
            case Level.A2:
                levelExplainLabel.text = Localization("Basic Level")
            case Level.B1:
                levelExplainLabel.text = Localization("Intermediate Level")
            case Level.B2:
                levelExplainLabel.text = Localization("Intermediate Level")
            case Level.C1:
                levelExplainLabel.text = Localization("Advanced Level")
            case Level.All:
                levelExplainLabel.text = Localization("Every Level")
            }
        }
        super.setText()
    }
    
    public override func setUp(frame: CGRect){
        super.setUp(frame: frame)
        
        //        let buttonHeigth = self.bounds.size.height
        let buttonWidth = self.bounds.size.width
        
        
        // Level explaination
        let heightLevelLabel = height(43)
        let marginTopLevelLabel = height(30)
        levelExplainLabel = UILabel(frame: CGRect(x: 0, y: marginTopLevelLabel + heightLevelLabel + height(9), width: buttonWidth, height: height(30)))
        levelExplainLabel.font = UIFont(name: "Avenir-Heavy", size: super.height(25))
        levelExplainLabel.textAlignment = .center
        levelExplainLabel.textColor = fontColorLight
        self.addSubview(levelExplainLabel)
        self.setText()
    }
    
    

    
    
    
}

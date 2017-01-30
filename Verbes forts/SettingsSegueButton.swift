//
//  SettingsSegueButton.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 19/01/2017.
//  Copyright © 2017 Lauriane Mollier. All rights reserved.
//

import UIKit

@IBDesignable
class SettingsSegueButton: SettingsButton {
    
    var desciptionLabel = UILabel()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.setTitleColor(UIColor.black, for: .normal)
        
        
        let arrowWidth = CGFloat(20)
        let arrowMarginRight = CGFloat(5)
        let arrowLabel = UILabel(frame: CGRect(x: self.frame.width - arrowWidth - arrowMarginRight, y: 0, width: arrowWidth, height: self.frame.height))
        arrowLabel.textAlignment = .center
        arrowLabel.textColor = UIColor.lightGray
        arrowLabel.text = ">"
        
        self.addSubview(arrowLabel)
        
        
        let desciptionWidth = CGFloat(40)
        let desciptionMarginRight = CGFloat(10)
        desciptionLabel.frame = CGRect(x: arrowLabel.frame.minX - desciptionWidth - desciptionMarginRight, y: 0, width: desciptionWidth, height: self.frame.height)
        desciptionLabel.textAlignment = .right
        desciptionLabel.textColor = defaultBlue
        
        self.addSubview(desciptionLabel)
    }
    
    func setDescription(descript: String){
        desciptionLabel.text = descript
        
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

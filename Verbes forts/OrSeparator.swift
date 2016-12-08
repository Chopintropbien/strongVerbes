//
//  OrSeparator.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 26/11/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import UIKit

@IBDesignable
class OrSeparator: UILabel {
    
    let lineWidth = CGFloat(2);
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let heightLabel = self.bounds.height
        let widthLabel = self.bounds.width
        
        // clear text in the label
        self.text = ""
        
        //or
        let orWidth = CGFloat(25)
        let orX = (widthLabel - orWidth)/2
        let or = UILabel(frame: CGRect(x: orX, y: 0, width: orWidth, height: heightLabel))
        or.adjustsFontSizeToFitWidth = true
        or.font = UIFont(name: "Avenir-Black", size: 16)
        or.textColor = gray
        or.textAlignment = .center
        or.text = "ou"
        self.addSubview(or)
        
        //line
        let lineColor = gray
        let marginOr = CGFloat(6)
        let marginLineBorderScreen = CGFloat(6)
        let lineRight = UILabel(frame: CGRect(x: marginLineBorderScreen, y: heightLabel/2, width: orX - marginOr - marginLineBorderScreen, height: lineWidth))
        lineRight.backgroundColor = lineColor
        self.addSubview(lineRight)
        
        
        let lineLeft = UILabel(frame: CGRect(x: orX + orWidth + marginOr, y: heightLabel/2, width: widthLabel - orX - orWidth - marginOr - marginLineBorderScreen, height: lineWidth))
        lineLeft.backgroundColor = lineColor
        self.addSubview(lineLeft)

    }
    

    
}

//
//  CategoryVerbeButton.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 08/10/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//


import UIKit


@IBDesignable
class CategoryVerbeButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = UIColor.whiteColor()
        self.setTitleColor(gray, forState: .Normal)
        self.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 14)
        self.titleLabel!.textAlignment = .Center
        self.contentVerticalAlignment = .Center
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 6
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.grayColor().CGColor
        self.layer.shadowRadius = 2
 
    }
}

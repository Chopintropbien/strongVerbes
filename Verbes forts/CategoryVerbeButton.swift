//
//  CategoryVerbeButton.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 08/10/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//


import UIKit

//TODO: refaire avec https://swift.unicorn.tv/articles/creating-custom-animated-buttons


@IBDesignable
class CategoryVerbeButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 14)
        self.titleLabel!.textAlignment = .center
        self.contentVerticalAlignment = .center
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 6
        self.layer.borderWidth = 1
        self.layer.borderColor = lightGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 20

    }
}

@IBDesignable
class CategoryVerbeButtonPink: CategoryVerbeButton{
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = pink
        self.setTitleColor(UIColor.white, for: UIControlState())
    }
}

@IBDesignable
class CategoryVerbeButtonFree: CategoryVerbeButton {
    override func layoutSubviews(){
        super.layoutSubviews()
        self.backgroundColor = freeColor
        self.setTitleColor(UIColor.white, for: UIControlState())
    }
}

@IBDesignable
class CategoryVerbeButtonWhite: CategoryVerbeButton {
    override func layoutSubviews(){
        super.layoutSubviews()
        self.backgroundColor = UIColor.white
        self.setTitleColor(gray, for: UIControlState())
    }
}

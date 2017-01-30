//
//  SettingsLabel.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 19/01/2017.
//  Copyright © 2017 Lauriane Mollier. All rights reserved.
//

import UIKit

@IBDesignable
class SettingsLabel: UILabel {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textAlignment = .left
        self.backgroundColor = UIColor.clear
        self.textColor = UIColor.gray
        self.font.withSize(15)
    }
    
}

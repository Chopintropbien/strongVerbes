//
//  BasicLabelBig.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 10/12/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import Foundation


import UIKit

@IBDesignable
class BasicLabelBig: UILabel {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.font = UIFont(name: "Avenir-Black", size: 22)
        self.textColor = fontColor
        self.textAlignment = .center
        
    }
    
}

@IBDesignable
class BasicLabelBigGray: UILabel {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.font = UIFont(name: "Avenir-Black", size: 22)
        self.textColor = UIColor.darkGray
        self.textAlignment = .center
    }
}

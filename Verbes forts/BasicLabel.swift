//
//  BasicLabel.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 08/10/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import UIKit

@IBDesignable
class BasicLabel: UILabel {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.font = UIFont(name: "Avenir-Black", size: 16)
        self.textColor = fontColor
        self.textAlignment = .Center

    }
    
}

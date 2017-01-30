//
//  SettingsButton.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 19/01/2017.
//  Copyright © 2017 Lauriane Mollier. All rights reserved.
//

import UIKit


extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect.init(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect.init(x: 0, y: 0, width: thickness, height: frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect.init(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
}


@IBDesignable
class SettingsButton: UIButton {
    
    public static let settingsPaddingLeft = CGFloat(16)
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.contentEdgeInsets.left = SettingsButton.settingsPaddingLeft
        self.contentHorizontalAlignment = .left
        self.backgroundColor = UIColor.white
        self.layer.addBorder(edge: .top, color: lightGray, thickness: 1)
        self.layer.addBorder(edge: .bottom, color: lightGray, thickness: 1)
        
        self.titleLabel!.font.withSize(18)
        
    }
    
}

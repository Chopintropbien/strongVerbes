//
//  BuyLevelButton.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 26/11/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//


import UIKit
import StoreKit


@IBDesignable
class BuyLevelButton: SelectPlusExplainButton {

    var levelExplainLabel: UILabel = UILabel()
    var buyButtonHandler: ((_ product: SKProduct) -> ())?
    var product: SKProduct? {
        didSet {
            guard let product = product else { return }
            BuyLevelButton.priceFormatter.locale = product.priceLocale
            levelExplainLabel.text = BuyLevelButton.priceFormatter.string(from: product.price)
        }
    }
    
    static let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.formatterBehavior = .behavior10_4
        formatter.numberStyle = .currency
        
        return formatter
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        //        let buttonHeigth = self.bounds.size.height
        let buttonWidth = self.bounds.size.width
        
        // Level explaination
        let heightLevelLabel = height(43)
        let marginTopLevelLabel = height(30)
        levelExplainLabel.frame = CGRect(x: 0, y: marginTopLevelLabel + heightLevelLabel + height(9), width: buttonWidth, height: height(65))
        levelExplainLabel.font = UIFont(name: "Avenir-Heavy", size: height(40))
        levelExplainLabel.textAlignment = .center
        levelExplainLabel.textColor = fontColorLight
        self.addSubview(levelExplainLabel)
    }
}


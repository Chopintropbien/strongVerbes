//
//  AskInAppPurschase.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 21/11/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import UIKit
import StoreKit

class AskInAppPurschase: UIViewController {
    var level: Level!
    var form: Form?
    var letter: LetterButton?
    
    var upperView: UIView!
    var products = [SKProduct]()
    
    
    // view if user can not buy (not allowed or no inernet connection)
    @IBOutlet weak var canNotBuyView: UIView!
    @IBOutlet weak var canNotBuyLabel: UILabel!
    @IBOutlet weak var canNotBuyText: UILabel!
    
    
    // view if user can buy
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var explainationBuy1LevelLabel: UILabel!
    let buy1LevelButton =  BuyLevelButton()
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var explainationBuyAllLevelLabel: UILabel!
    let buyAllLevelButton =  BuyLevelButton()
    
    let animationDuration: TimeInterval = 3
    
    
    
    
    override func viewDidLoad() {
        self.upperView.isHidden = true
        self.containerView.isHidden = true
        self.canNotBuyView.isHidden = true
        placeElement()
        
        
        
        // if there is no internet connection
        let delay = 1 * Double(NSEC_PER_SEC)
        let time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time) {
            
        }
    }
    
    func setText(){
        titleLabel.text = Localization("Do you want to learn even more verbs?")
        explainationBuy1LevelLabel.text = Localization("Full access to all verbs in ") + self.level.rawValue + Localization(" level")
        self.buy1LevelButton.setTitle(self.level.rawValue, for: UIControlState())
        explainationBuyAllLevelLabel.text = Localization("Full access to ALL verbs in ALL level")
        self.buyAllLevelButton.setTitle(Localization("All"), for: UIControlState())
    }
    
    
    
    func display(view: UIView){
        self.upperView.isHidden = false
        self.containerView.isHidden = true
        self.canNotBuyView.isHidden = true
        setText()
        self.animation(view: view, display: true)
        
    }
    
    func hide(){
        self.animation(view: self.containerView, display: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDuration) {
            self.upperView.isHidden = true
            self.canNotBuyView.isHidden = true
        }
    }
    
    private func animation(view: UIView, display: Bool){
        let transitionOptions: UIViewAnimationOptions
        if(display){
            transitionOptions = UIViewAnimationOptions.transitionCurlDown
        }
        else{
            transitionOptions = UIViewAnimationOptions.transitionCurlUp
            
        }
        
        UIView.transition(with: view, duration: self.animationDuration, options: transitionOptions, animations: {
            view.isHidden = !display
        }, completion: nil)
    }
    
    // place element in containerView
    private func placeElement(){
        let screenHeight = view.bounds.size.height
        let screenWidth = view.bounds.size.width
        
        // size in pixel from the model
        let designHeight: CGFloat = 1334.0
        let designWidth: CGFloat = 750.0
        
        // helper function for computer the proportions
        func height(_ h: Double) -> CGFloat{
            return screenHeight * (CGFloat(h)/designHeight)
        }
        func width(_ w: Double) -> CGFloat{
            return screenWidth * (CGFloat(w)/designWidth)
        }
        // Button and label dimention
        let buyLevelButtonHeight = height(200)
        let buyLevelButtonWidth = width(500)
        let titleLabelHeight = height(50)
        let explainationBuyLevelLabelHeight = height(120)
        
        let explainationBuyLevelLabelMarginTopButtom = height(80)
        let explainationBuyLevelLabelMarginRight = height(70)
        let buyLevelButtonMarginTop = height(34)
        
        let explainationBuyLevelLabelNumberOfLines = 2
        
        
        //titleLabel
        let titleLabelY = height(40)
        titleLabel.layer.frame = CGRect(x: 0, y: titleLabelY, width: screenWidth, height: titleLabelHeight)
        
        /* buy 1 level */
        // explainationBuy1LevelLabel
        let explainationBuy1LevelLabelY = titleLabelY + titleLabelHeight + explainationBuyLevelLabelMarginTopButtom
        // buy1LevelButton
        let buy1LevelButtonY = explainationBuy1LevelLabelY + explainationBuyLevelLabelHeight + buyLevelButtonMarginTop
        
        func placeFirstProduct(explaination: UILabel, button: BuyLevelButton){
            
            // explaination label
            explaination.layer.frame = CGRect(x: explainationBuyLevelLabelMarginRight, y: explainationBuy1LevelLabelY, width: screenWidth - explainationBuyLevelLabelMarginRight*2, height: explainationBuyLevelLabelHeight)
            explaination.lineBreakMode = NSLineBreakMode.byWordWrapping
            explaination.numberOfLines = explainationBuyLevelLabelNumberOfLines
            
            //buy label
            button.layer.frame = CGRect(x: (screenWidth - buyLevelButtonWidth) / 2, y: buy1LevelButtonY, width: buyLevelButtonWidth, height: buyLevelButtonHeight)
            self.containerView.addSubview(button)
        }
        
        
        if(level == Level.All){
            placeFirstProduct(explaination: explainationBuyAllLevelLabel, button: buyAllLevelButton)
            explainationBuy1LevelLabel.isHidden = true
            buy1LevelButton.isHidden = true
            orLabel.isHidden = true
        }
        else{
            placeFirstProduct(explaination: explainationBuy1LevelLabel, button: buy1LevelButton)
            
            // or
            let orLabelY = buy1LevelButtonY + buyLevelButtonHeight + explainationBuyLevelLabelMarginTopButtom
            
            /* buy All level */
            // explainationBuyAllLevelLabel
            let explainationBuyAllLevelLabelY = orLabelY + titleLabelHeight + explainationBuyLevelLabelMarginTopButtom
            
            // buyAllLevelButton
            let buyAllLevelButtonY = explainationBuyAllLevelLabelY + explainationBuyLevelLabelHeight + buyLevelButtonMarginTop
            
            
            func placeSecondProduct(){
                // or
                orLabel.layer.frame = CGRect(x: 0, y: orLabelY, width: screenWidth, height: titleLabelHeight)
                
                // explaination label
                explainationBuyAllLevelLabel.layer.frame = CGRect(x: explainationBuyLevelLabelMarginRight, y: explainationBuyAllLevelLabelY, width: screenWidth - explainationBuyLevelLabelMarginRight*2, height: explainationBuyLevelLabelHeight)
                explainationBuyAllLevelLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
                explainationBuyAllLevelLabel.numberOfLines = explainationBuyLevelLabelNumberOfLines
                
                //buy label
                buyAllLevelButton.layer.frame = CGRect(x: (screenWidth - buyLevelButtonWidth) / 2, y: buyAllLevelButtonY, width: buyLevelButtonWidth, height: buyLevelButtonHeight)
                self.containerView.addSubview(buyAllLevelButton)
            }
            placeSecondProduct()
        }
        
    }
    
    
    
    //TODO: It is the right way?
    func loadProducts(){
        products = []
        Products.store.requestProducts{success, products in
            if success {
                self.products = products!
                
                let id = Products.productId(level: self.level)
                self.buy1LevelButton.product = self.findProduct(products: self.products, id: id)
                self.buy1LevelButton.addTarget(self, action: #selector(self.buyButtonTapped(_:)), for: .touchUpInside)
                
                
                
                self.buyAllLevelButton.product = self.findProduct(products: self.products, id: Products.productId(level: Level.All))
                self.buyAllLevelButton.addTarget(self, action: #selector(self.buyButtonTapped(_:)), for: .touchUpInside)
                self.displayIfNotPurchased(products: self.products, internetConnection: true)
            }
            else{
                self.displayIfNotPurchased(products: self.products, internetConnection: false) // no internet connection
            }
            
        }
    }
    
    func buyButtonTapped(_ sender: BuyLevelButton) {
        Products.store.buyProduct(sender.product!)
    }
    
    func displayIfNotPurchased(products: [SKProduct], internetConnection: Bool) {
        if((form == Form.aiea || letter == LetterButton.A)){
            // do not display
            self.upperView.isHidden = true
        }
        else if(!internetConnection){
            setTextCanNotBuyViewNoInternetConnection()
            display(view: self.canNotBuyView)
        }
        else if(level == Level.All && self.isA2B1B2C1ArePurchased(products: products)){
            // do not display
            self.upperView.isHidden = true
        }
        else if(!IAPHelper.canMakePayments()){
            setTextCanNotBuyViewCanNotMakePayments()
            display(view: self.canNotBuyView)
        }
            // display
        else if(!Products.store.isProductPurchased(Products.productId(level: self.level)) && !Products.store.isProductPurchased(Products.productId(level: Level.All))){
            display(view: self.containerView)
        }
    }
    
    func setTextCanNotBuyViewNoInternetConnection(){
        self.canNotBuyLabel.text = Localization("No internet connection")
        self.canNotBuyText.text = Localization("This page is only accessible with a connection internet.")
    }
    func setTextCanNotBuyViewCanNotMakePayments(){
        self.canNotBuyLabel.text = Localization("Your are not allowed to buy this product")
        self.canNotBuyText.text = Localization("Our application in accessible by all people 4+")
    }
    
    
    
    
    func findProduct(products: [SKProduct], id: String) -> SKProduct{
        return products.filter({$0.productIdentifier == id}).first!
    }
    
    func isA2B1B2C1ArePurchased(products: [SKProduct]) -> Bool{
        var arePurchased = true;
        for p in products{
            if(p.productIdentifier != Products.AllProductId){
                arePurchased = arePurchased && Products.store.isProductPurchased(p.productIdentifier)
            }
        }
        return arePurchased
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadProducts()
    }
    
    func foldl<A,B>(acc: A, list: Array<B>, f: (A, B) -> A) -> A {
        var result = acc
        for item in list {
            result = f(result, item)
        }
        return result
    }
}

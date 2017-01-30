//
//  RevisionVerbes.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 30/08/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//


import UIKit
import AVFoundation


class RevisionVerbes: UIViewController {
    
    var level: Level!
    var form: Form?
    var letter: LetterButton?
    
    
    @IBOutlet weak var askInAppPurschaseView: UIView!
    var askInAppPurschaseVC: AskInAppPurschase?
    
    
    // Text
    
    var verbes: [Verbe] = []
    var cursor: Int = 0
    var nextButtonText: String = ""
    var headerText: String = ""
    var nextButtonHidden = false
    
    // Action duration
    let removeHiddingduration: Double = 1.2
    let replaceHiddingduration: Double = 0.7
    let changeVerbeHiddingduration: Double = 0.4
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var infinitifLabel: UILabel!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var preteritLabel: UILabel!
    @IBOutlet weak var parfaitLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    
    // set the max size of label : Importante for func sizeInfinitifLabel
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    var verbeWidth:CGFloat = 0
    var infinitifLabelY:CGFloat = 0
    var infinitifLabelheight:CGFloat = 0
    var revealedImageMarginRight:CGFloat = 0
    var revealedImageWidth: CGFloat = 0
    
    
    
    
    @IBOutlet weak var revealedImage: UIImageView!
    @IBOutlet weak var hiddingImage: UIImageView!
    
    @IBOutlet weak var superViewHiddingButton: UIView!
    
    @IBOutlet weak var hiddingButton: UIButton!
    
    
    @IBOutlet weak var soundButton: UIBarButtonItem!
    @IBAction func changeSound(_ sender: UIBarButtonItem) {
        if(sounds){
            sender.title = "🔕"
            sounds = false
        }
        else{
            sender.title = "🔔"
            sounds = true
        }
    }
    
    var formatAudio = "mp3"
    var nameAudioFile = String()
    var audioURL = URL(fileURLWithPath: Bundle.main.path(forResource: "anbieten", ofType: "mp3")!)
    var audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "anbieten", ofType: "mp3")!), fileTypeHint: nil) // Grrrrrrr!!!!! Pourquoi???? audioPlayer.stop()
    
    
    override func viewWillAppear(_ animated: Bool) {
        /* set tilte */
        
        if(level == Level.All){
            self.title = Localization("All")
        }
        else{
            self.title = level.rawValue
        }
        
        if((form) != nil){
            if(form == Form.undefine){
                self.title! += ": " + Localization("unclassifiable")
            }
            else if(form == Form.weak){
                self.title! += ": " + Localization("weak-irregular")
            }
            else {
                self.title! += ": " + form!.rawValue
            }
        }
        else{
            self.title! += ": " + letter!.rawValue
        }
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* If have access  */
        
        // display the correct sounds button
        if(sounds){ soundButton.title = "🔔"}
        else{ soundButton.title = "🔕"}
        
        // display the first verbe
        if(!self.verbes.isEmpty){
            self.headerLabel.text = headerText
            self.nextButton.setTitle(nextButtonText, for: UIControlState())
            self.finishButton.setTitle(Localization("Finish"), for: UIControlState()) // TODO: trad
            self.initVerbe()
        }
        
        // if just one verbes, don't dysplay the next button
        self.finishButton.isHidden = true
        if(nextButtonHidden){
            self.nextButton.isHidden = true
            self.finishButton.isHidden = false
        }
        
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        // explanation
        let headerLabelMarginTop = height(190)
        let headerLabelHeight = height(98)
        let headerLabelMarginRight = width(100)
        headerLabel.frame = CGRect(x: headerLabelMarginRight, y: headerLabelMarginTop, width: screenWidth - headerLabelMarginRight*2, height: headerLabelHeight)
        
        // Translation
        let translationLabelMarginTop = height(18)
        let translationLabelHeight = height(98)
        let translationLabelY = translationLabelMarginTop + headerLabelHeight + headerLabelMarginTop
        translationLabel.frame = CGRect(x: 0, y: translationLabelY, width: screenWidth, height: translationLabelHeight)
        translationLabel.textColor = gray
        translationLabel.font = UIFont(name: "Avenir-Heavy", size: 32)
        
        
        
        
        // Images and button for return the carte
        let revealedImageMarginTop = height(20)
        let revealedImageY = translationLabelY + revealedImageMarginTop + translationLabelHeight
        let revealedImageHeight = height(700)
        revealedImageWidth =  revealedImageHeight*640/739
        revealedImageMarginRight = (screenWidth - revealedImageWidth)/2 - 1
        revealedImage.frame = CGRect(x: revealedImageMarginRight, y: revealedImageY, width: revealedImageWidth, height: revealedImageHeight)
        
        superViewHiddingButton.frame = revealedImage.frame
        hiddingImage.frame = CGRect(x: 0, y: 0, width: superViewHiddingButton.bounds.width, height: superViewHiddingButton.bounds.height)
        hiddingButton.frame = hiddingImage.frame
        
        // German verbe
        
        
        let verbeInsideImgWidth = width(60)
        let verbeMarginRight = verbeInsideImgWidth + revealedImageMarginRight
        verbeWidth = revealedImageWidth - verbeInsideImgWidth*2
        let verbeHeight = height(70)
        let verbeMarginTop = height(30)
        
        
        // infinitif
        infinitifLabelY = height(110) + revealedImageY
        infinitifLabelheight = height(100)
        resizeInfinitifLabel()
        infinitifLabel.textColor = UIColor.white
        infinitifLabel.font = UIFont(name: "Avenir-Black", size: 27)
        infinitifLabel.textAlignment = .center
        infinitifLabel.layer.cornerRadius = 14
        infinitifLabel.layer.borderWidth = 2
        infinitifLabel.layer.borderColor = UIColor.white.cgColor
        
        // present
        let presentLabelMarginTop = height(45)
        let presentLabelY = infinitifLabelY + infinitifLabelheight + presentLabelMarginTop
        presentLabel.frame = CGRect(x: verbeMarginRight, y: presentLabelY, width: verbeWidth, height: verbeHeight)
        presentLabel.textColor = cream
        presentLabel.font = UIFont(name: "Avenir-Heavy", size: 22)
        presentLabel.textAlignment = .center
        
        // preterit
        let preteritLabelY = presentLabelY + verbeHeight + verbeMarginTop
        preteritLabel.frame = CGRect(x: verbeMarginRight, y: preteritLabelY, width: verbeWidth, height: verbeHeight)
        preteritLabel.textColor = presentLabel.textColor
        preteritLabel.font = presentLabel.font
        presentLabel.textAlignment = presentLabel.textAlignment
        
        
        // parfait
        let parfaitLabelY = preteritLabelY + verbeHeight + verbeMarginTop
        parfaitLabel.frame = CGRect(x: verbeMarginRight, y: parfaitLabelY, width: verbeWidth, height: verbeHeight)
        parfaitLabel.textColor = presentLabel.textColor
        parfaitLabel.font = presentLabel.font
        parfaitLabel.textAlignment = presentLabel.textAlignment
        
        
        // nextButton
        let nextButtonMarginRight = width(40)
        let nextButtonMarginTop = height(40)
        let nextButtonY = nextButtonMarginTop + revealedImageY + revealedImageHeight
        let nextButtonHeight = height(120)
        nextButton.frame = CGRect(x: nextButtonMarginRight, y: nextButtonY, width: screenWidth - nextButtonMarginRight*2, height: nextButtonHeight)
        nextButton.setTitleColor(UIColor.white, for: UIControlState())
        nextButton.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 18)
        nextButton.backgroundColor = pink
        nextButton.layer.cornerRadius = 4
        
        
        // finishButton
        finishButton.frame = CGRect(x: nextButtonMarginRight, y: nextButtonY, width: screenWidth - nextButtonMarginRight*2, height: nextButtonHeight)
        finishButton.setTitleColor(UIColor.white, for: UIControlState())
        finishButton.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 18)
        finishButton.backgroundColor = darkPink
        finishButton.layer.cornerRadius = 4
        
        
        
    }
    
    fileprivate func resizeInfinitifLabel(){
        infinitifLabel.sizeToFit()
        var newWidth = infinitifLabel.bounds.width + width(120)
        if(newWidth > verbeWidth) {newWidth = verbeWidth}
        
        let x = (revealedImageWidth - newWidth)/2 + revealedImageMarginRight
        infinitifLabel.frame = CGRect(x: x, y: infinitifLabelY, width: newWidth, height: infinitifLabelheight)
        
    }
    //    🔔🔕
    func initVerbe(){
        translationLabel.text = verbes[cursor].translation(GetLanguage())
        infinitifLabel.text = verbes[cursor].infinitf()
        presentLabel.text = verbes[cursor].present()
        preteritLabel.text = verbes[cursor].preterit()
        parfaitLabel.text = verbes[cursor].parfait()
        
        // resize infinitifLabel
        resizeInfinitifLabel()
    }
    
    @IBAction func showVerbe() {
        let transitionOptions = UIViewAnimationOptions.transitionCurlUp
        UIView.transition(with: superViewHiddingButton, duration: removeHiddingduration, options: transitionOptions, animations: {
            self.hiddingButton.isHidden = true
            self.hiddingImage.isHidden = true
        }, completion: nil)
        
        if(sounds) {
            playAudio()
        }
    }
    
    // TODO: securiser
    func playAudio(){
        
        do {
            nameAudioFile = verbes[cursor].infinitf()
            audioURL = URL(fileURLWithPath: Bundle.main.path(forResource: nameAudioFile, ofType: formatAudio)!)
            audioPlayer = try! AVAudioPlayer(contentsOf: audioURL, fileTypeHint: nil)
            audioPlayer.play()
            audioPlayer.numberOfLoops = Setting.numberLecture() - 1
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        }
        catch {
            // report for an error
        }
    }
    
    @IBAction func finishRevisionVerbe(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
            if let nav = self.navigationController{
                nav.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func showNextVerbe() {
        /* stop lecture */
        audioPlayer.stop()
        
        /* display the next verbe in the list */
        
        // Don't display the "Next" button if it will be the last verbe
        if(cursor == verbes.count - 2){
            self.nextButton.isHidden = true
            self.finishButton.isHidden = false
        }
        if(cursor < verbes.count - 1) {
            cursor += 1
            var changeVerbeDuration = changeVerbeHiddingduration // delay for display the next verbes: don't have to be before the animation to hide the new verbe
            if(self.hiddingButton.isHidden == true){
                // do the animation to hide the new verbe
                let transitionOptions = UIViewAnimationOptions.transitionCurlDown
                UIView.transition(with: superViewHiddingButton, duration: replaceHiddingduration, options: transitionOptions, animations: {
                    self.hiddingButton.isHidden = false
                    self.hiddingImage.isHidden = false
                }, completion: nil)
            }
            else{ // will display the new verbe right away
                changeVerbeDuration = 0
            }
            
            // display the new verbe
            let delay = changeVerbeDuration * Double(NSEC_PER_SEC)
            let time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: time) {
                // After *changeVerbeHiddingduration* seconds this line will be executed
                self.initVerbe()
            }
        }
    }
    
    
    
    // helper function for computer the proportions
    fileprivate func height(_ h: Double) -> CGFloat{
        let designHeight: CGFloat = 1334.0
        
        return screenHeight * (CGFloat(h)/designHeight)
    }
    fileprivate func width(_ w: Double) -> CGFloat{
        let designWidth: CGFloat = 750.0
        
        return screenWidth * (CGFloat(w)/designWidth)
    }
    
    // for the container view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "askInAppPurschaseSegue") {
            askInAppPurschaseVC = segue.destination as? AskInAppPurschase
            
            askInAppPurschaseVC?.upperView = askInAppPurschaseView
            askInAppPurschaseVC?.level = self.level
            
            if let form = self.form{
                askInAppPurschaseVC?.form = form
            }
            if let letter = self.letter{
                askInAppPurschaseVC?.letter = letter
            }
            
        }
    }
    //hide askInAppPurschaseView
    public func hideAskInAppPurschaseView(){
        askInAppPurschaseVC?.hide()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

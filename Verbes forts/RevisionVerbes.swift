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
    
    // Text

    var verbes: [Verbe] = []
    var cursor: Int = 0
    var nextButtonText: String = ""
    var headerText: String = ""
    
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
    @IBAction func changeSound(sender: UIBarButtonItem) {
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
    var audioURL = NSURL()
    var audioPlayer = try! AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("anbieten", ofType: "mp3")!), fileTypeHint: nil) // Grrrrrrr!!!!! Pourquoi???? audioPlayer.stop()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // display the correct sounds button
        if(sounds){ soundButton.title = "🔔"}
        else{ soundButton.title = "🔕"}
        
        // display the first verbe
        if(!self.verbes.isEmpty){
            self.headerLabel.text = headerText
            self.nextButton.setTitle(nextButtonText, forState: .Normal)
            self.initVerbe()
        }
        else if(self.verbes.count == 1){ // if just one verbes, don't dysplay the next button
            self.nextButton.hidden = true
        }
        
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        // explanation
        let headerLabelMarginTop = height(190)
        let headerLabelHeight = height(98)
        let headerLabelMarginRight = width(100)
        headerLabel.frame = CGRectMake(headerLabelMarginRight, headerLabelMarginTop, screenWidth - headerLabelMarginRight*2, headerLabelHeight)
        
        // Translation
        let translationLabelMarginTop = height(18)
        let translationLabelHeight = height(98)
        let translationLabelY = translationLabelMarginTop + headerLabelHeight + headerLabelMarginTop
        translationLabel.frame = CGRectMake(0, translationLabelY, screenWidth, translationLabelHeight)
        translationLabel.textColor = gray
        translationLabel.font = UIFont(name: "Avenir-Heavy", size: 32)
        
        
        

        // Images and button for return the carte
        let revealedImageMarginTop = height(20)
        let revealedImageY = translationLabelY + revealedImageMarginTop + translationLabelHeight
        let revealedImageHeight = height(700)
        revealedImageWidth =  revealedImageHeight*640/739
        revealedImageMarginRight = (screenWidth - revealedImageWidth)/2 - 1
        revealedImage.frame = CGRectMake(revealedImageMarginRight, revealedImageY, revealedImageWidth, revealedImageHeight)
        
        superViewHiddingButton.frame = revealedImage.frame
        hiddingImage.frame = CGRectMake(0, 0, superViewHiddingButton.bounds.width, superViewHiddingButton.bounds.height)
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
        infinitifLabel.textColor = UIColor.whiteColor()
        infinitifLabel.font = UIFont(name: "Avenir-Black", size: 27)
        infinitifLabel.textAlignment = .Center
        infinitifLabel.layer.cornerRadius = 14
        infinitifLabel.layer.borderWidth = 2
        infinitifLabel.layer.borderColor = UIColor.whiteColor().CGColor
        
        // present
        let presentLabelMarginTop = height(45)
        let presentLabelY = infinitifLabelY + infinitifLabelheight + presentLabelMarginTop
        presentLabel.frame = CGRectMake(verbeMarginRight, presentLabelY, verbeWidth, verbeHeight)
        presentLabel.textColor = cream
        presentLabel.font = UIFont(name: "Avenir-Heavy", size: 22)
        presentLabel.textAlignment = .Center
        
        // preterit
        let preteritLabelY = presentLabelY + verbeHeight + verbeMarginTop
        preteritLabel.frame = CGRectMake(verbeMarginRight, preteritLabelY, verbeWidth, verbeHeight)
        preteritLabel.textColor = presentLabel.textColor
        preteritLabel.font = presentLabel.font
        presentLabel.textAlignment = presentLabel.textAlignment
        
        
        // parfait
        let parfaitLabelY = preteritLabelY + verbeHeight + verbeMarginTop
        parfaitLabel.frame = CGRectMake(verbeMarginRight, parfaitLabelY, verbeWidth, verbeHeight)
        parfaitLabel.textColor = presentLabel.textColor
        parfaitLabel.font = presentLabel.font
        parfaitLabel.textAlignment = presentLabel.textAlignment
        
        
        // nextButton
        let nextButtonMarginRight = width(40)
        let nextButtonMarginTop = height(40)
        let nextButtonY = nextButtonMarginTop + revealedImageY + revealedImageHeight
        let nextButtonHeight = height(120)
        nextButton.frame = CGRectMake(nextButtonMarginRight, nextButtonY, screenWidth - nextButtonMarginRight*2, nextButtonHeight)
        nextButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        nextButton.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 18)
        nextButton.backgroundColor = pink
        nextButton.layer.cornerRadius = 4
        
    
        
    }
    
    private func resizeInfinitifLabel(){
        infinitifLabel.sizeToFit()
        var newWidth = infinitifLabel.bounds.width + width(120)
        if(newWidth > verbeWidth) {newWidth = verbeWidth}
        
        let x = (revealedImageWidth - newWidth)/2 + revealedImageMarginRight
        infinitifLabel.frame = CGRectMake(x, infinitifLabelY, newWidth, infinitifLabelheight)

    }
//    🔔🔕
    func initVerbe(){
        translationLabel.text = verbes[cursor].translation(getLang())
        infinitifLabel.text = verbes[cursor].infinitf()
        presentLabel.text = verbes[cursor].present()
        preteritLabel.text = verbes[cursor].preterit()
        parfaitLabel.text = verbes[cursor].parfait()
        
        // resize infinitifLabel
        resizeInfinitifLabel()
    }
    
    @IBAction func showVerbe() {
        let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
        UIView.transitionWithView(superViewHiddingButton, duration: removeHiddingduration, options: transitionOptions, animations: {
            self.hiddingButton.hidden = true
            self.hiddingImage.hidden = true
            }, completion: nil)
        
        if(sounds) { playAudio() }
    }
    
    func playAudio(){
        nameAudioFile = verbes[cursor].infinitf()
        audioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(nameAudioFile, ofType: formatAudio)!)
        audioPlayer = try! AVAudioPlayer(contentsOfURL: audioURL, fileTypeHint: nil)
        audioPlayer.play()
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        }
        catch {
            // report for an error
        }
    }


    @IBAction func showNextVerbe() {
        /* stop lecture */
        audioPlayer.stop()
        
        /* display the next verbe in the list */
        
        // Don't display the "Next" button if it will be the last verbe
        if(cursor == verbes.count - 2){
            self.nextButton.hidden = true
        }
        if(cursor < verbes.count - 1) {
            cursor += 1
            var changeVerbeDuration = changeVerbeHiddingduration // delay for display the next verbes: don't have to be before the animation to hide the new verbe
            if(self.hiddingButton.hidden == true){
                // do the animation to hide the new verbe
                let transitionOptions = UIViewAnimationOptions.TransitionCurlDown
                UIView.transitionWithView(superViewHiddingButton, duration: replaceHiddingduration, options: transitionOptions, animations: {
                    self.hiddingButton.hidden = false
                    self.hiddingImage.hidden = false
                    }, completion: nil)
            }
            else{ // will display the new verbe right away
                changeVerbeDuration = 0
            }
            
            // display the new verbe
            let delay = changeVerbeDuration * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                // After *changeVerbeHiddingduration* seconds this line will be executed
                self.initVerbe()
            }
        }
    }

    
    
    // helper function for computer the proportions
    private func height(h: Double) -> CGFloat{
        let designHeight: CGFloat = 1334.0
        
        return screenHeight * (CGFloat(h)/designHeight)
    }
    private func width(w: Double) -> CGFloat{
        let designWidth: CGFloat = 750.0
        
        return screenWidth * (CGFloat(w)/designWidth)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//
//  RevisionVerbes.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 30/08/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//


import UIKit
import iAd
import AVFoundation


class RevisionVerbes: UIViewController, ADBannerViewDelegate {
    

    var bannerView: ADBannerView!

    var advertisement = false
    
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
    
    
    @IBOutlet weak var superViewHiddingButton: UIView!
    
    @IBOutlet weak var hiddingButton: UIButton!
    var contraintsHiddingButton: [NSLayoutConstraint] = []
    
    

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
        else{ // if no verbes
            //TODO: 
        }
        
        // dysplay advertisment
        if(advertisement){
            self.canDisplayBannerAds = true
            bannerView = ADBannerView(adType: .Banner)
            bannerView.translatesAutoresizingMaskIntoConstraints = false
            bannerView.delegate = self
            bannerView.hidden = true
            view.addSubview(bannerView)
            let viewsDictionary = ["bannerView": bannerView]
            view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[bannerView]|", options: [], metrics: nil, views: viewsDictionary))
            view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[bannerView]|", options: [], metrics: nil, views: viewsDictionary))
        }
        
    }
//    🔔🔕
    func initVerbe(){
        translationLabel.text = verbes[cursor].translation(getLang())
        infinitifLabel.text = verbes[cursor].infinitf()
        presentLabel.text = verbes[cursor].present()
        preteritLabel.text = verbes[cursor].preterit()
        parfaitLabel.text = verbes[cursor].parfait()
    }
    
    @IBAction func showVerbe() {
        contraintsHiddingButton = self.hiddingButton.constraints
        let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
        UIView.transitionWithView(superViewHiddingButton, duration: removeHiddingduration, options: transitionOptions, animations: {
            self.hiddingButton.hidden = true
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
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        bannerView.hidden = false
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        bannerView.hidden = true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
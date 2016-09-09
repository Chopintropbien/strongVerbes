//
//  RevisionVerbes.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 30/08/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//


import UIKit
import iAd


class RevisionVerbes: UIViewController, ADBannerViewDelegate {
    

    var bannerView: ADBannerView!

    var advertisement = false
    
    // Text

    var verbes: [Verbe] = []
    var cursor: Int = 0
    var nextButtonText: String = "Suivant"
    var headerText: String = "Voici les verbes forts allemand de la forme a-e-a"
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        if(!self.verbes.isEmpty){
            self.headerLabel.text = headerText
            self.initVerbe()
        }
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
    func initVerbe(){
        translationLabel.text = verbes[cursor].translation(Lang.fr)
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
        
    }

    @IBAction func showNextVerbe() {
        if(cursor == verbes.count - 2){
            self.nextButton.hidden = true
        }
        if(cursor < verbes.count - 1) {
            cursor += 1
            
            var changeVerbeDuration = changeVerbeHiddingduration
            if(self.hiddingButton.hidden == true){
                let transitionOptions = UIViewAnimationOptions.TransitionCurlDown
                UIView.transitionWithView(superViewHiddingButton, duration: replaceHiddingduration, options: transitionOptions, animations: {
                    self.hiddingButton.hidden = false
                    }, completion: nil)
                
            }
            else{
                changeVerbeDuration = 0
            }
                
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
//
//  SettingsUIView.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 19/01/2017.
//  Copyright © 2017 Lauriane Mollier. All rights reserved.
//

import UIKit



class SettingsUIView: UIViewController {
    
    @IBOutlet weak var grammarHelpLabel: SettingsLabel!
    @IBOutlet weak var grammarButton: SettingsSegueButton!
    @IBOutlet weak var helpButton: SettingsSegueButton!
    
    @IBOutlet weak var generalLabel: SettingsLabel!
    @IBOutlet weak var languageButton: SettingsSegueButton!
    @IBOutlet weak var numberLectureButton: SettingsSegueButton!
    @IBOutlet weak var numberRandomButton: SettingsSegueButton!
    
    @IBOutlet weak var inAppPurshaseLabel: SettingsLabel!
    @IBOutlet weak var inAppPurshaseButton: SettingsDirectButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        setText()
        super.viewDidAppear(animated)
    }
    
    
    
    
    
    @IBAction func restorePurchases(_ sender: SettingsDirectButton) {
        Products.store.restorePurchases()
    }
    // TODO: To traduice
    
    private func setText(){
        self.title = Localization("Settings")
        
        grammarHelpLabel.text = Localization("Grammar and help")
        grammarButton.setTitle(Localization("Grammar"), for: .normal)
        helpButton.setTitle(Localization("Help"), for: .normal)
        
        generalLabel.text = Localization("General")
        languageButton.setTitle(Localization("Language"), for: .normal)
        numberLectureButton.setTitle(Localization("Number of reading"), for: .normal)
        numberRandomButton.setTitle(Localization("Number of random verb"), for: .normal)
        
        inAppPurshaseLabel.text = Localization("Service action")
        inAppPurshaseButton.setTitle(Localization("Restore previus purchases"), for: .normal)
        
        numberLectureButton.setDescription(descript: String(Setting.numberLecture()))
        numberRandomButton.setDescription(descript: String(Setting.numberRandom()))
    }
    
}

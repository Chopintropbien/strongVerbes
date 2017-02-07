//
//  Help.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 27/01/2017.
//  Copyright © 2017 Lauriane Mollier. All rights reserved.
//

import UIKit

class Help: UIViewController {
    
    @IBOutlet weak var tilteHelp: UILabel!

    @IBOutlet weak var introText1: UITextView!
    @IBOutlet weak var introText2: UITextView!
    @IBOutlet weak var titleRandomOrder: UILabel!
    @IBOutlet weak var textRandomOrder: UITextView!
    @IBOutlet weak var titleClassifiedForm: UILabel!
    @IBOutlet weak var textClassifiedForm: UITextView!
    @IBOutlet weak var titleAlphabetical: UILabel!
    @IBOutlet weak var textAlphabetical: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = Localization("Help")
        
        tilteHelp.text = Localization("introTitle")
        introText1.text = Localization("introText1")
        introText2.text = Localization("introText2")
        titleRandomOrder.text = Localization("titleRandomOrder")
        textRandomOrder.text = Localization("textRandomOrder")
        titleClassifiedForm.text = Localization("titleClassifiedForm")
        textClassifiedForm.text = Localization("textClassifiedForm")
        titleAlphabetical.text = Localization("titleAlphabetical")
        textAlphabetical.text = Localization("textAlphabetical")
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

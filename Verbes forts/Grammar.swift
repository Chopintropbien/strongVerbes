//
//  Grammar.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 27/01/2017.
//  Copyright © 2017 Lauriane Mollier. All rights reserved.
//

import UIKit

class Grammar: UIViewController {
  
    @IBOutlet weak var intro: UITextView!
    @IBOutlet weak var titleWeak: UILabel!
    @IBOutlet weak var textWeak: UITextView!
    @IBOutlet weak var titleStrong: UILabel!
    @IBOutlet weak var textStrong: UITextView!
    @IBOutlet weak var titleIrregularWeak: UILabel!
    @IBOutlet weak var textIrregularWeak: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = Localization("Grammar")
        
        intro.text = Localization("intro")
        titleWeak.text = Localization("titleWeak")
        textWeak.text = Localization("textWeak")
        titleStrong.text = Localization("titleStrong")
        textStrong.text = Localization("textStrong")
        titleIrregularWeak.text = Localization("titleIrregularWeak")
        textIrregularWeak.text = Localization("textIrregularWeak")
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

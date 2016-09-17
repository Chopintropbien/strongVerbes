//
//  ChooseVerbes.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 26/08/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import UIKit



class ChooseVerbes: UIViewController, ENSideMenuDelegate {
    
    let words = DisplayWords(lang: langSetting)
    
    @IBOutlet weak var randomOrderButton: UIButton!
    @IBOutlet weak var formOrderLabel: UILabel!
    @IBOutlet weak var alphabeticOrderLabel: UILabel!
    
    @IBOutlet weak var unclassable: UIButton!
    @IBOutlet weak var weakIregular: UIButton!
    
    private var sounds = true
    @IBAction func changeSound(sender: UIBarButtonItem) {
        if(self.sounds){
            sender.title = "🔕"
            sounds = false
        }
        else{
            sender.title = "🔔"
            sounds = true
        }
        
    }
    
    @IBAction func showLanguageMenu(sender: UIBarButtonItem) {
        toggleSideMenuView()
    }
    
    
    
    @IBAction func getViewVerbes(sender: UIButton){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = words.titleChooseVerbes()
        self.randomOrderButton.setTitle(words.randomOrder(), forState: .Normal)
        self.formOrderLabel.text = words.formOrderLabel()
        self.alphabeticOrderLabel.text = words.alphabeticOrderLabel()
        
        unclassable.setTitle(words.unclassable(), forState: .Normal)
        weakIregular.setTitle(words.weakIregularMasculin(), forState: .Normal)
    }
    
    
    private let verbesData = Verbes()

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let rev = segue.destinationViewController as? RevisionVerbes{
            
            // set sounds
            rev.sounds = self.sounds
            
            let nbVerbeRandom = 15
            let headerTextRandom: String = words.headerTextRandom(nbVerbeRandom)
            let unclassable: String = words.unclassable()
            let weakIregular: String = words.weakIregularFeminin()
            
            
            func setTextInStringType(form: String){
                rev.headerText = words.hereVerbesWithForm(form)
                setStaticButton()
            }
            func setTextInFormType(form: Form){
                setTextInStringType(form.rawValue)
            }
            
            func setTextInLetterType(letter: LetterButton){
                rev.headerText = words.hereVerbesWhoBeginBuy(letter)
                setStaticButton()
            }
            
            func setTextRandom(){
                rev.headerText = headerTextRandom
                setStaticButton()
            }

            func setStaticButton(){
                rev.nextButtonText = words.next()
            }
            
            
            
////             print all the verbes
//            func foldl(list:Array<String>, base:String) -> String {
//                var result = base
//                for item in list {
//                    result = result + item
//                }
//                return result
//            }
//            
//            print(verbesData.verbes.count)
//            print(foldl(verbesData.verbes.map({"\($0.infinitf()), \($0.translation(Lang.fr))\n" }), base: ""))
 
 
            
            if let id = segue.identifier{
                switch id {
                case LetterButton.A.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.A)
                    setTextInLetterType(LetterButton.A)
                case LetterButton.B.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.B)
                    setTextInLetterType(LetterButton.B)
                case LetterButton.DE.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.DE)
                    setTextInLetterType(LetterButton.DE)
                case LetterButton.F.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.G)
                    setTextInLetterType(LetterButton.G)
                case LetterButton.HK.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.HK)
                    setTextInLetterType(LetterButton.HK)
                case LetterButton.LM.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.LM)
                    setTextInLetterType(LetterButton.LM)
                case LetterButton.NPQ.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.NPQ)
                    setTextInLetterType(LetterButton.NPQ)
                case LetterButton.R.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.R)
                    setTextInLetterType(LetterButton.R)
                case LetterButton.S1.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.S1)
                    setTextInLetterType(LetterButton.S1)
                case LetterButton.S2.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.S2)
                    setTextInLetterType(LetterButton.S2)
                case LetterButton.S3.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.S3)
                    setTextInLetterType(LetterButton.S3)
                case LetterButton.T.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.T)
                    setTextInLetterType(LetterButton.T)
                case LetterButton.UV.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.UV)
                    setTextInLetterType(LetterButton.UV)
                case LetterButton.WZ.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.WZ)
                    setTextInLetterType(LetterButton.WZ)
                
                case Form.aiea.rawValue:
                    rev.verbes = verbesData.filterBy(Form.aiea)
                    setTextInFormType(Form.aiea)
                case Form.aua.rawValue:
                    rev.verbes = verbesData.filterBy(Form.aua)
                    setTextInFormType(Form.aua)
                case Form.eae.rawValue:
                    rev.verbes = verbesData.filterBy(Form.eae)
                    setTextInFormType(Form.eae)
                case Form.eao.rawValue:
                    rev.verbes = verbesData.filterBy(Form.eao)
                    setTextInFormType(Form.eao)
                case Form.eiieie.rawValue:
                    rev.verbes = verbesData.filterBy(Form.eiieie)
                    setTextInFormType(Form.eiieie)
                case Form.eiii.rawValue:
                    rev.verbes = verbesData.filterBy(Form.eiii)
                    setTextInFormType(Form.eiii)
                case Form.iao.rawValue:
                    rev.verbes = verbesData.filterBy(Form.iao)
                    setTextInFormType(Form.iao)
                case Form.iau.rawValue:
                    rev.verbes = verbesData.filterBy(Form.iau)
                    setTextInFormType(Form.iao)
                case Form.ieoo.rawValue:
                    rev.verbes = verbesData.filterBy(Form.ieoo)
                    setTextInFormType(Form.ieoo)
                case Form.undefine.rawValue:
                    rev.verbes = verbesData.filterBy(Form.undefine)
                    setTextInStringType(unclassable)
                case Form.weak.rawValue:
                    rev.verbes = verbesData.filterBy(Form.weak)
                    setTextInStringType(weakIregular)
                case "random":
                    rev.verbes = []
                    for _ in 1...nbVerbeRandom{
                        let randomIndex = Int(arc4random_uniform(UInt32(verbesData.verbes.count)))
                        rev.verbes.append(verbesData.verbes[randomIndex])
                    }
                    setTextRandom()
                default:
                    rev.verbes = []
                }
            }
        }
    }
    
    
//    override func
    
    
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}


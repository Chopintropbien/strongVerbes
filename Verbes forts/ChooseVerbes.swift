//
//  ChooseVerbes.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 26/08/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import UIKit



class ChooseVerbes: UIViewController, ENSideMenuDelegate {
    
    var level: Level = Level.All
    
    
    @IBOutlet weak var randomOrderButton: UIButton!
    @IBOutlet weak var formOrderLabel: UILabel!
    @IBOutlet weak var alphabeticOrderLabel: UILabel!
    
    @IBOutlet weak var unclassable: UIButton!
    @IBOutlet weak var weakIregular: UIButton!
    
    @IBAction func showLanguageMenu(sender: UIBarButtonItem) {
        toggleSideMenuView()
    }
    
    
    @IBAction func getViewVerbes(sender: UIButton){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = displaidWords.titleChooseVerbes()
        self.randomOrderButton.setTitle(displaidWords.randomOrder(), forState: .Normal)
        self.formOrderLabel.text = displaidWords.formOrderLabel()
        self.alphabeticOrderLabel.text = displaidWords.alphabeticOrderLabel()
        
        unclassable.setTitle(displaidWords.unclassable(), forState: .Normal)
        weakIregular.setTitle(displaidWords.weakIregularMasculin(), forState: .Normal)
    }
    
    
    private let verbesData = Verbes()

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let rev = segue.destinationViewController as? RevisionVerbes{
            
            let nbVerbeRandom = 15
            let headerTextRandom: String = displaidWords.headerTextRandom(nbVerbeRandom)
            let unclassable: String = displaidWords.unclassable()
            let weakIregular: String = displaidWords.weakIregularFeminin()
            
            
            func setTextInStringType(form: String){
                rev.headerText = displaidWords.hereVerbesWithForm(form)
                setStaticButton()
            }
            func setTextInFormType(form: Form){
                setTextInStringType(form.rawValue)
            }
            
            func setTextInLetterType(letter: LetterButton){
                rev.headerText = displaidWords.hereVerbesWhoBeginBuy(letter)
                setStaticButton()
            }
            
            func setTextRandom(){
                rev.headerText = headerTextRandom
                setStaticButton()
            }

            func setStaticButton(){
                rev.nextButtonText = displaidWords.next()
            }
            
            
            
//             print all the verbes
            func foldl(list:Array<String>, base:String) -> String {
                var result = base
                for item in list {
                    result = result + item
                }
                return result
            }
            
            print(verbesData.verbes.count)
            print(foldl(verbesData.verbes.filter({$0.level == Level.needToAngerister}).map({"\($0.infinitf()), \($0.present()), \($0.preterit()), \($0.parfait())\n" }), base: ""))
 
 
            
            // TODO:: Mieux faire les choses
            
            // sort verbes by letter and by level
            func filterVerbeByLetter(letter: LetterButton) -> [Verbe]{
                return verbesData.filterBy(letter, level: level)
            }
            // sort verbes by form and by level
            func filterVerbeByForm(form: Form) -> [Verbe]{
                return verbesData.filterBy(form, level: level)
            }
            
            if let id = segue.identifier{
                switch id {
                case LetterButton.A.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.A)
                    setTextInLetterType(LetterButton.A)
                case LetterButton.B.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.B)
                    setTextInLetterType(LetterButton.B)
                case LetterButton.DE.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.DE)
                    setTextInLetterType(LetterButton.DE)
                case LetterButton.F.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.G)
                    setTextInLetterType(LetterButton.G)
                case LetterButton.HK.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.HK)
                    setTextInLetterType(LetterButton.HK)
                case LetterButton.LM.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.LM)
                    setTextInLetterType(LetterButton.LM)
                case LetterButton.NPQ.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.NPQ)
                    setTextInLetterType(LetterButton.NPQ)
                case LetterButton.R.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.R)
                    setTextInLetterType(LetterButton.R)
                case LetterButton.S1.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.S1)
                    setTextInLetterType(LetterButton.S1)
                case LetterButton.S2.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.S2)
                    setTextInLetterType(LetterButton.S2)
                case LetterButton.S3.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.S3)
                    setTextInLetterType(LetterButton.S3)
                case LetterButton.T.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.T)
                    setTextInLetterType(LetterButton.T)
                case LetterButton.UV.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.UV)
                    setTextInLetterType(LetterButton.UV)
                case LetterButton.WZ.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.WZ)
                    setTextInLetterType(LetterButton.WZ)
                
                case Form.aiea.rawValue:
                    rev.verbes = filterVerbeByForm(Form.aiea)
                    setTextInFormType(Form.aiea)
                case Form.aua.rawValue:
                    rev.verbes = filterVerbeByForm(Form.aua)
                    setTextInFormType(Form.aua)
                case Form.eae.rawValue:
                    rev.verbes = filterVerbeByForm(Form.eae)
                    setTextInFormType(Form.eae)
                case Form.eao.rawValue:
                    rev.verbes = filterVerbeByForm(Form.eao)
                    setTextInFormType(Form.eao)
                case Form.eiieie.rawValue:
                    rev.verbes = filterVerbeByForm(Form.eiieie)
                    setTextInFormType(Form.eiieie)
                case Form.eiii.rawValue:
                    rev.verbes = filterVerbeByForm(Form.eiii)
                    setTextInFormType(Form.eiii)
                case Form.iao.rawValue:
                    rev.verbes = filterVerbeByForm(Form.iao)
                    setTextInFormType(Form.iao)
                case Form.iau.rawValue:
                    rev.verbes = filterVerbeByForm(Form.iau)
                    setTextInFormType(Form.iao)
                case Form.ieoo.rawValue:
                    rev.verbes = filterVerbeByForm(Form.ieoo)
                    setTextInFormType(Form.ieoo)
                case Form.undefine.rawValue:
                    rev.verbes = filterVerbeByForm(Form.undefine)
                    setTextInStringType(unclassable)
                case Form.weak.rawValue:
                    rev.verbes = filterVerbeByForm(Form.weak)
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


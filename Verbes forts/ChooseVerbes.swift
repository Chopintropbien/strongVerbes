//
//  ChooseVerbes.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 26/08/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import UIKit



class ChooseVerbes: UIViewController {
        
    @IBAction func getViewVerbes(sender: UIButton){
        
    }
    
    private let verbesData = Verbes()

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let rev = segue.destinationViewController as? RevisionVerbes{
            
            let nbVerbeRandom = 15
            let headerTextRandom = "Essayer de vous souvenir de ses " + String(nbVerbeRandom) + " mots"
            let unclassable = "inclassable"
            let weakIregular = "faible irrégulière"
            
            func setTextInFormType(form: Form){
                rev.headerText = "Voici les verbes forts allemand de la forme " + form.rawValue
                setStaticButton()
            }
            func setTextInLetterType(letter: LetterButton){
                rev.headerText = "Voici les verbes forts allemand commençant par " + letter.rawValue.uppercaseString
                setStaticButton()
            }
            func setTextInStringType(form: String){
                rev.headerText = "Voici les verbes forts allemand de forme " + form
                setStaticButton()
            }
            
            func setStaticButton(){
                rev.nextButtonText = "Suivant"
            }
            
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
                case LetterButton.LMN.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.LMN)
                    setTextInLetterType(LetterButton.LMN)
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
                case LetterButton.W.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.W)
                    setTextInLetterType(LetterButton.W)
                case LetterButton.Z.rawValue:
                    rev.verbes = verbesData.filterBy(LetterButton.Z)
                    setTextInLetterType(LetterButton.Z)
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
                    rev.headerText = headerTextRandom
                default:
                    rev.verbes = []
                }
            }
        }
    }
    
    
//    override func
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}


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
    
    @IBOutlet weak var randomOrderLabel: UILabel!
    @IBOutlet weak var formOrderLabel: UILabel!
    @IBOutlet weak var alphabeticOrderLabel: UILabel!
    
    
    @IBOutlet weak var aieaButton: UIButton!
    @IBOutlet weak var auaButton: UIButton!
    @IBOutlet weak var eaeButton: UIButton!
    @IBOutlet weak var eaoButton: UIButton!
    @IBOutlet weak var eiieieButton: UIButton!
    @IBOutlet weak var eiiiButton: UIButton!
    @IBOutlet weak var iaoButton: UIButton!
    @IBOutlet weak var iauButton: UIButton!
    @IBOutlet weak var eiooButton: UIButton!

    @IBOutlet weak var unclassable: UIButton!
    @IBOutlet weak var weakIregular: UIButton!
    
    @IBOutlet weak var AButton: UIButton!
    @IBOutlet weak var BButton: UIButton!
    @IBOutlet weak var DEButton: UIButton!
    @IBOutlet weak var FButton: UIButton!
    @IBOutlet weak var GButton: UIButton!
    
    @IBOutlet weak var HKButton: UIButton!
    @IBOutlet weak var LMButton: UIButton!
    @IBOutlet weak var NPQButton: UIButton!
    @IBOutlet weak var RButton: UIButton!
    @IBOutlet weak var S1Button: UIButton!
    @IBOutlet weak var S2Button: UIButton!
    @IBOutlet weak var S3Button: UIButton!
    @IBOutlet weak var TButton: UIButton!
    @IBOutlet weak var UVButton: UIButton!
    @IBOutlet weak var WZButton: UIButton!
    


    @IBAction func getViewVerbes(_ sender: UIButton){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set text in the choosed language
        self.title = Localization("Irregular verbs")
        self.randomOrderButton.setTitle(Localization("Random"), for: UIControlState())
        self.randomOrderLabel.text = Localization("Random order")
        self.formOrderLabel.text = Localization("Classified by form")
        self.alphabeticOrderLabel.text = Localization("Classified by alphabetical order")
        
        unclassable.setTitle(Localization("unclassifiable"), for: UIControlState())
        weakIregular.setTitle(Localization("weak-irregular-masculin"), for: UIControlState())
        

        
//        let screenHeight = self.view.bounds.height
        let screenWidth = self.view.bounds.width
        
        // 1th label
        let labelHeight = height(65)
        let randomOrderLabelMarginTop = height(180)
        randomOrderLabel.frame = CGRect(x: 0, y: randomOrderLabelMarginTop, width: screenWidth, height: labelHeight)
        
        // Random Button
        let buttonHeight = height(70)
        let randomOrderButtonMarginTop = height(25)
        let randomOrderButtonY = randomOrderLabelMarginTop + randomOrderButtonMarginTop + labelHeight
        randomOrderButton.frame = CGRect(x: width(245), y: randomOrderButtonY, width: width(275), height: buttonHeight + height(25))
        randomOrderButton.backgroundColor = pink
        randomOrderButton.setTitleColor(UIColor.white, for: UIControlState())
        
        // 2th label
        let formOrderLabelMarginTop = height(45)
        let formOrderLabelY = randomOrderButtonY + buttonHeight + formOrderLabelMarginTop
        formOrderLabel.frame = CGRect(x: 0, y: formOrderLabelY, width: screenWidth, height: labelHeight)
        
        
        // All the form button
        let row1MarginTop = height(25)
        let marginBottomBetweenTwo = height(14)
        
        let formWidth = width(203)
        let formMarginToBorder = width(43)
        let formMarginRightBetweenTwo = (screenWidth - formWidth*3 - formMarginToBorder*2) * 0.5
        
        
        let row1FormY = formOrderLabelY + labelHeight + row1MarginTop
        let row2FormY = row1FormY + buttonHeight + marginBottomBetweenTwo
        let row3FormY = row2FormY + buttonHeight + marginBottomBetweenTwo
        let row4FormY = row3FormY + buttonHeight + marginBottomBetweenTwo
        
        let column1FormY = formMarginToBorder
        let column2FormY = column1FormY + formWidth + formMarginRightBetweenTwo
        let column3FormY = column2FormY + formWidth + formMarginRightBetweenTwo
        
        
        aieaButton.frame = CGRect(x: column1FormY, y: row1FormY, width: formWidth, height: buttonHeight)
        auaButton.frame = CGRect(x: column2FormY, y: row1FormY, width: formWidth, height: buttonHeight)
        eaeButton.frame = CGRect(x: column3FormY, y: row1FormY, width: formWidth, height: buttonHeight)
        
        eaoButton.frame = CGRect(x: column1FormY, y: row2FormY, width: formWidth, height: buttonHeight)
        eiieieButton.frame = CGRect(x: column2FormY, y: row2FormY, width: formWidth, height: buttonHeight)
        eiiiButton.frame = CGRect(x: column3FormY, y: row2FormY, width: formWidth, height: buttonHeight)
        
        
        // desactivate this button for B1-2 because a lack of verb in this cathegory
        if(level == Level.B1 || level == Level.B2){
            iaoButton.isHidden = true
            iauButton.frame = CGRect(x: column1FormY + width(116), y: row3FormY, width: formWidth, height: buttonHeight)
            eiooButton.frame = CGRect(x: column2FormY + width(116), y: row3FormY, width: formWidth, height: buttonHeight)
        }
        else{
            iaoButton.frame = CGRect(x: column1FormY, y: row3FormY, width: formWidth, height: buttonHeight)
            iauButton.frame = CGRect(x: column2FormY, y: row3FormY, width: formWidth, height: buttonHeight)
            eiooButton.frame = CGRect(x: column3FormY, y: row3FormY, width: formWidth, height: buttonHeight)
        }
        
        // special enplacement for "unclassable" and "weakIregular"
        let formBigWidth = width(250)
        let formbigMarginToBorder = width(116)
        unclassable.frame = CGRect(x: formbigMarginToBorder, y: row4FormY, width: formBigWidth, height: buttonHeight)
        weakIregular.frame = CGRect(x: formbigMarginToBorder + formBigWidth + formMarginRightBetweenTwo, y: row4FormY, width: formBigWidth, height: buttonHeight)
        
        
        
        // 3th label
        let alphabeticOrderLabelLabelY = row4FormY + buttonHeight + formOrderLabelMarginTop
        alphabeticOrderLabel.frame = CGRect(x: 0, y: alphabeticOrderLabelLabelY, width: screenWidth, height: labelHeight)
        
        
        // All the letter button
        let letterWidth = width(165)
        let letterMarginToBorder = width(25)
        let letterMarginRightBetweenTwo = (screenWidth - letterWidth*4 - letterMarginToBorder*2)/3.0
        
        
        let row1LetterY = alphabeticOrderLabelLabelY + labelHeight + row1MarginTop
        let row2LetterY = row1LetterY + buttonHeight + marginBottomBetweenTwo
        let row3LetterY = row2LetterY + buttonHeight + marginBottomBetweenTwo
        let row4LetterY = row3LetterY + buttonHeight + marginBottomBetweenTwo
        
        
        let column1LetterY = letterMarginToBorder
        let column2LetterY = column1LetterY + letterWidth + letterMarginRightBetweenTwo
        let column3LetterY = column2LetterY + letterWidth + letterMarginRightBetweenTwo
        let column4LetterY = column3LetterY + letterWidth + letterMarginRightBetweenTwo
        
        
        AButton.frame = CGRect(x: column1LetterY, y: row1LetterY, width: letterWidth, height: buttonHeight)
        BButton.frame = CGRect(x: column2LetterY, y: row1LetterY, width: letterWidth, height: buttonHeight)
        DEButton.frame = CGRect(x: column3LetterY, y: row1LetterY, width: letterWidth, height: buttonHeight)
        FButton.frame = CGRect(x: column4LetterY, y: row1LetterY, width: letterWidth, height: buttonHeight)
        
        GButton.frame = CGRect(x: column1LetterY, y: row2LetterY, width: letterWidth, height: buttonHeight)
        HKButton.frame = CGRect(x: column2LetterY, y: row2LetterY, width: letterWidth, height: buttonHeight)
        LMButton.frame = CGRect(x: column3LetterY, y: row2LetterY, width: letterWidth, height: buttonHeight)
        NPQButton.frame = CGRect(x: column4LetterY, y: row2LetterY, width: letterWidth, height: buttonHeight)
        
        RButton.frame = CGRect(x: column1LetterY, y: row3LetterY, width: letterWidth, height: buttonHeight)
        S1Button.frame = CGRect(x: column2LetterY, y: row3LetterY, width: letterWidth, height: buttonHeight)
        S2Button.frame = CGRect(x: column3LetterY, y: row3LetterY, width: letterWidth, height: buttonHeight)
        S3Button.frame = CGRect(x: column4LetterY, y: row3LetterY, width: letterWidth, height: buttonHeight)
        
        let letterbigMarginToBorder = width(90)
        TButton.frame = CGRect(x: column1LetterY + letterbigMarginToBorder, y: row4LetterY, width: letterWidth, height: buttonHeight)
        UVButton.frame = CGRect(x: column2LetterY + letterbigMarginToBorder, y: row4LetterY, width: letterWidth, height: buttonHeight)
        WZButton.frame = CGRect(x: column3LetterY + letterbigMarginToBorder, y: row4LetterY, width: letterWidth, height: buttonHeight)
        
        
        
        
        
        
    }
    
    
    fileprivate let verbesData = Verbes()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let rev = segue.destination as? RevisionVerbes{
            
            let nbVerbeRandom = 15
            let headerTextRandom: String = Localization("Try to remember this ") + String(nbVerbeRandom) + Localization(" verbes")
            let unclassable: String =  Localization("unclassifiable")
            let weakIregular: String = Localization("weak-irregular-feminin")
            
            
            func setTextInStringType(_ form: String){
                switch form {
                case Form.weak.rawValue:
                    rev.headerText = Localization("Here are german irregular verbs by form: weak-irregular")
                case Form.undefine.rawValue:
                    rev.headerText = Localization("Here are german irregular verbs by form: unclassifiable") + form
                default:
                    rev.headerText = Localization("Here are german irregular verbs by form: ") + form
                }
                
                
                setStaticButton()
            }
            func setTextInFormType(_ form: Form){
                setTextInStringType(form.rawValue)
            }
            
            func setTextInLetterType(_ letter: LetterButton){
                rev.headerText = Localization("Here are german irregular verbs who begins buy: ") + letter.rawValue.uppercased()
                setStaticButton()
            }
            
            func setTextRandom(){
                rev.headerText = headerTextRandom
                setStaticButton()
            }

            func setStaticButton(){
                rev.nextButtonText = Localization("Next")
            }
            
            
            
//             print all the verbes
            func foldl(_ list:Array<String>, base:String) -> String {
                var result = base
                for item in list {
                    result = result + item
                }
                return result
            }
            
            
//            verbesData.witchCategoriesAreNotAvalable()
//            verbesData.testAllAudio()
//
//            print(verbesData.verbes.count)
//            print(foldl(verbesData.verbes.map({
//                let a = "Verbe(level: Level." + $0.level.rawValue
//                + ", form: Form." + $0.form.rawValue
//                + ", verbe: (\"" + $0.infinitf()
//                + "\", \"er " + $0.present()
//                + "\", \"er " + $0.preterit()
//                let b = "\", \"er " + $0.parfait()
//                + "\"), translations: [(Lang.fr, \""+$0.translation(Lang.fr)
//                + "\"), (Lang.en, \"" + $0.translation(Lang.en)
//                + "\"), (Lang.es, \"" + $0.translation(Lang.es)
//                + "\"), (Lang.ru, \""+$0.translation(Lang.ru)+"\")]),\n\n"
//                
//                return a + b
//            }), base: ""))
            
//                "\($0.infinitf()), \($0.present()), \($0.preterit()), \($0.parfait())\n" }), base: ""))
 
 
            
            // TODO:: Mieux faire les choses
            
            // sort verbes by letter and by level
            func filterVerbeByLetter(_ letter: LetterButton) -> [Verbe]{
                return verbesData.filterBy(letter, level: level)
            }
            // sort verbes by form and by level
            func filterVerbeByForm(_ form: Form) -> [Verbe]{
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
                    rev.verbes = filterVerbeByLetter(LetterButton.F)
                    setTextInLetterType(LetterButton.F)
                case LetterButton.G.rawValue:
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
    

    
    // helper function for computer the proportions
    fileprivate func height(_ h: Double) -> CGFloat{
        let screenHeight = self.view.bounds.height
        let designHeight: CGFloat = 1334.0
        
        return screenHeight * (CGFloat(h)/designHeight)
    }
    fileprivate func width(_ w: Double) -> CGFloat{
        let screenWidth = self.view.bounds.width
        let designWidth: CGFloat = 750.0
        
        return screenWidth * (CGFloat(w)/designWidth)
    }


    
    

}


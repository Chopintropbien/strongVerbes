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
        

        
//        let screenHeight = self.view.bounds.height
        let screenWidth = self.view.bounds.width
        
        // 1th label
        let labelHeight = height(65)
        let randomOrderLabelMarginTop = height(170)
        randomOrderLabel.frame = CGRectMake(0, randomOrderLabelMarginTop, screenWidth, labelHeight)
        
        // Random Button
        let buttonHeight = height(65)
        let randomOrderButtonMarginTop = height(45)
        let randomOrderButtonY = randomOrderLabelMarginTop + randomOrderButtonMarginTop + labelHeight
        randomOrderButton.frame = CGRectMake(width(238), randomOrderButtonY, width(275), buttonHeight)
        
        // 2th label
        let formOrderLabelMarginTop = height(65)
        let formOrderLabelY = randomOrderButtonY + buttonHeight + formOrderLabelMarginTop
        formOrderLabel.frame = CGRectMake(0, formOrderLabelY, screenWidth, labelHeight)
        
        
        // All the form button
        let row1MarginTop = height(45)
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
        
        
        aieaButton.frame = CGRectMake(column1FormY, row1FormY, formWidth, buttonHeight)
        auaButton.frame = CGRectMake(column2FormY, row1FormY, formWidth, buttonHeight)
        eaeButton.frame = CGRectMake(column3FormY, row1FormY, formWidth, buttonHeight)
        
        eaoButton.frame = CGRectMake(column1FormY, row2FormY, formWidth, buttonHeight)
        eiieieButton.frame = CGRectMake(column2FormY, row2FormY, formWidth, buttonHeight)
        eiiiButton.frame = CGRectMake(column3FormY, row2FormY, formWidth, buttonHeight)
        
        
        // desactivate this button for B1-2 because a lack of verb in this cathegory
        if(level == Level.B1 || level == Level.B2){
            iaoButton.hidden = true
            iauButton.frame = CGRectMake(column1FormY + width(116), row3FormY, formWidth, buttonHeight)
            eiooButton.frame = CGRectMake(column2FormY + width(116), row3FormY, formWidth, buttonHeight)
        }
        else{
            iaoButton.frame = CGRectMake(column1FormY, row3FormY, formWidth, buttonHeight)
            iauButton.frame = CGRectMake(column2FormY, row3FormY, formWidth, buttonHeight)
            eiooButton.frame = CGRectMake(column3FormY, row3FormY, formWidth, buttonHeight)
        }
        
        // special enplacement for "unclassable" and "weakIregular"
        let formBigWidth = width(250)
        let formbigMarginToBorder = width(116)
        unclassable.frame = CGRectMake(formbigMarginToBorder, row4FormY, formBigWidth, buttonHeight)
        weakIregular.frame = CGRectMake(formbigMarginToBorder + formBigWidth + formMarginRightBetweenTwo, row4FormY, formBigWidth, buttonHeight)
        
        
        
        // 3th label
        let alphabeticOrderLabelLabelY = row4FormY + buttonHeight + formOrderLabelMarginTop
        alphabeticOrderLabel.frame = CGRectMake(0, alphabeticOrderLabelLabelY, screenWidth, labelHeight)
        
        
        // All the letter button
        let letterWidth = width(165)
        let letterMarginToBorder = width(25)
//        let row1FormMarginTop = height(45)
//        let letterMarginBottomBetweenTwo = height(14)
        let letterMarginRightBetweenTwo = (screenWidth - letterWidth*4 - letterMarginToBorder*2)/3.0
        
        
        let row1LetterY = alphabeticOrderLabelLabelY + labelHeight + row1MarginTop
        let row2LetterY = row1LetterY + buttonHeight + marginBottomBetweenTwo
        let row3LetterY = row2LetterY + buttonHeight + marginBottomBetweenTwo
        let row4LetterY = row3LetterY + buttonHeight + marginBottomBetweenTwo
        
        
        let column1LetterY = letterMarginToBorder
        let column2LetterY = column1LetterY + letterWidth + letterMarginRightBetweenTwo
        let column3LetterY = column2LetterY + letterWidth + letterMarginRightBetweenTwo
        let column4LetterY = column3LetterY + letterWidth + letterMarginRightBetweenTwo
        
        
        AButton.frame = CGRectMake(column1LetterY, row1LetterY, letterWidth, buttonHeight)
        BButton.frame = CGRectMake(column2LetterY, row1LetterY, letterWidth, buttonHeight)
        DEButton.frame = CGRectMake(column3LetterY, row1LetterY, letterWidth, buttonHeight)
        FButton.frame = CGRectMake(column4LetterY, row1LetterY, letterWidth, buttonHeight)
        
        GButton.frame = CGRectMake(column1LetterY, row2LetterY, letterWidth, buttonHeight)
        HKButton.frame = CGRectMake(column2LetterY, row2LetterY, letterWidth, buttonHeight)
        LMButton.frame = CGRectMake(column3LetterY, row2LetterY, letterWidth, buttonHeight)
        NPQButton.frame = CGRectMake(column4LetterY, row2LetterY, letterWidth, buttonHeight)
        
        RButton.frame = CGRectMake(column1LetterY, row3LetterY, letterWidth, buttonHeight)
        S1Button.frame = CGRectMake(column2LetterY, row3LetterY, letterWidth, buttonHeight)
        S2Button.frame = CGRectMake(column3LetterY, row3LetterY, letterWidth, buttonHeight)
        S3Button.frame = CGRectMake(column4LetterY, row3LetterY, letterWidth, buttonHeight)
        
        let letterbigMarginToBorder = width(90)
        TButton.frame = CGRectMake(column1LetterY + letterbigMarginToBorder, row4LetterY, letterWidth, buttonHeight)
        UVButton.frame = CGRectMake(column2LetterY + letterbigMarginToBorder, row4LetterY, letterWidth, buttonHeight)
        WZButton.frame = CGRectMake(column3LetterY + letterbigMarginToBorder, row4LetterY, letterWidth, buttonHeight)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
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
            
            
            verbesData.witchCategoriesAreNotAvalable()
            
//            print(verbesData.verbes.count)
            print(foldl(verbesData.verbes.map({"\($0.infinitf()), \($0.present()), \($0.preterit()), \($0.parfait())\n" }), base: ""))
 
 
            
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
    

    
    // helper function for computer the proportions
    private func height(h: Double) -> CGFloat{
        let screenHeight = self.view.bounds.height
        let designHeight: CGFloat = 1334.0
        
        return screenHeight * (CGFloat(h)/designHeight)
    }
    private func width(w: Double) -> CGFloat{
        let screenWidth = self.view.bounds.width
        let designWidth: CGFloat = 750.0
        
        return screenWidth * (CGFloat(w)/designWidth)
    }


    
    

}


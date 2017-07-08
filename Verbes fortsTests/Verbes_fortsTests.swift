//
//  Verbes_fortsTests.swift
//  Verbes fortsTests
//
//  Created by Lauriane Mollier on 26/08/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import XCTest
@testable import Verbes_forts

class Verbes_fortsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        for v in Verbes().verbes{
            
            var vs = "IrregularVerbToSave(0, \"" + v.infinitf() + "\", \"" + v.present() + "\", \"" + v.preterit() + "\", \"" + v.parfait() + "\", LangToLearn.de, Level."
            vs = vs + v.level.rawValue + ", FormVerb." + v.form.rawValue + ", (MotherLang.en, \"" + v.translation(Lang.en) + "\") :: "
            vs = vs + "(MotherLang.es, \"" + v.translation(Lang.es) + "\") :: "
            vs = vs + "(MotherLang.fr, \"" + v.translation(Lang.fr) + "\") :: "
            vs = vs + "(MotherLang.ru, \"" + v.translation(Lang.ru) + "\") :: "
            vs = vs + " Nil) :: \n"
            print(vs)
            
        }
        
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

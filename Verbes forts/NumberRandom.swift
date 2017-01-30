//
//  NumberRandom.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 27/01/2017.
//  Copyright © 2017 Lauriane Mollier. All rights reserved.
//

import UIKit

class NumberRandom: SettingsTableViewController {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let nbRan = Setting.numberRandom()
        switch nbRan {
        case 5:
            selectedMenuItem = 0
        case 10:
            selectedMenuItem = 1
        case 15:
            selectedMenuItem = 2
        case 20:
            selectedMenuItem = 3
        case 25:
            selectedMenuItem = 4
        case 30:
            selectedMenuItem = 5
        case 40:
            selectedMenuItem = 6
        case 50:
            selectedMenuItem = 7
        case 100:
            selectedMenuItem = 8
        default:
            selectedMenuItem = 2
        }
    }
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
        
        let nbRan = Setting.numberRandom()
        switch nbRan {
        case 5:
            selectedMenuItem = 0
        case 10:
            selectedMenuItem = 1
        case 15:
            selectedMenuItem = 2
        case 20:
            selectedMenuItem = 3
        case 25:
            selectedMenuItem = 4
        case 30:
            selectedMenuItem = 5
        case 40:
            selectedMenuItem = 6
        case 50:
            selectedMenuItem = 7
        case 100:
            selectedMenuItem = 8
        default:
            selectedMenuItem = 2
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = Localization("Number of random verb title")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        
        if (cell == nil) {
            cell = createCell()
        }
        
        switch((indexPath as NSIndexPath).row){
        case 0:
            cell!.textLabel?.text = "5"
        case 1:
            cell!.textLabel?.text = "10"
        case 2:
            cell!.textLabel?.text = "15"
        case 3:
            cell!.textLabel?.text = "20"
        case 4:
            cell!.textLabel?.text = "25"
        case 5:
            cell!.textLabel?.text = "30"
        case 6:
            cell!.textLabel?.text = "40"
        case 7:
            cell!.textLabel?.text = "50"
        case 8:
            cell!.textLabel?.text = "100"
        default: cell!.textLabel?.text = "15"
        }
        
        return cell!
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMenuItem = (indexPath as NSIndexPath).row
        
        switch ((indexPath as NSIndexPath).row) {
        case 0:
            Setting.numberRandom(nbRand: 5)
        case 1:
            Setting.numberRandom(nbRand: 10)
        case 2:
            Setting.numberRandom(nbRand: 15)
        case 3:
            Setting.numberRandom(nbRand: 20)
        case 4:
            Setting.numberRandom(nbRand: 25)
        case 5:
            Setting.numberRandom(nbRand: 30)
        case 6:
            Setting.numberRandom(nbRand: 40)
        case 7:
            Setting.numberRandom(nbRand: 50)
        case 8:
            Setting.numberRandom(nbRand: 100)
        default:
            Setting.numberRandom(nbRand: 15)
        }
        
        super.popSelf()
        
    }
    
    
}

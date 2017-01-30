//
//  chooseLangMenu.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 15/09/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import UIKit

class ChooseLangMenu: SettingsTableViewController {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        switch GetLanguage() {
        case Lang.en:
            selectedMenuItem = 0
        case Lang.fr:
            selectedMenuItem = 1
        case Lang.es:
            selectedMenuItem = 2
        case Lang.it:
            selectedMenuItem = 3
        case Lang.ru:
            selectedMenuItem = 4
        case Lang.zh:
            selectedMenuItem = 5
        case Lang.ja:
            selectedMenuItem = 6
        case Lang.ar:
            selectedMenuItem = 7
        default:
            selectedMenuItem = 0
        }
        
    }
    override init(style: UITableViewStyle) {
        super.init(style: style)
        
        switch GetLanguage() {
        case Lang.en:
            selectedMenuItem = 0
        case Lang.fr:
            selectedMenuItem = 1
        case Lang.es:
            selectedMenuItem = 2
        case Lang.it:
            selectedMenuItem = 3
        case Lang.ru:
            selectedMenuItem = 4
        case Lang.zh:
            selectedMenuItem = 5
        case Lang.ja:
            selectedMenuItem = 6
        case Lang.ar:
            selectedMenuItem = 7
        default:
            selectedMenuItem = 0
        }
        
        
    }
    init(){
        super.init(style: UITableViewStyle.plain)
        
        switch GetLanguage() {
        case Lang.en:
            selectedMenuItem = 0
        case Lang.fr:
            selectedMenuItem = 1
        case Lang.es:
            selectedMenuItem = 2
        case Lang.it:
            selectedMenuItem = 3
        case Lang.ru:
            selectedMenuItem = 4
        case Lang.zh:
            selectedMenuItem = 5
        case Lang.ja:
            selectedMenuItem = 6
        case Lang.ar:
            selectedMenuItem = 7
        default:
            selectedMenuItem = 0
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = Localization("Language")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    // Return the number of sections.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Return the number of rows in the section.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    // initiat table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        
        if (cell == nil) {
            cell = createCell()
        }
        
        
        switch((indexPath as NSIndexPath).row){
        case 0:
            cell!.textLabel?.text = "English"
        case 1:
            cell!.textLabel?.text = "Français"
        case 2:
            cell!.textLabel?.text = "Español"
        case 3:
            cell!.textLabel?.text = "Italiano"
        case 4:
            cell!.textLabel?.text = "Русский"
        case 5:
            cell!.textLabel?.text = "中文"
        case 6:
            cell!.textLabel?.text = "日本語"
        case 7:
            cell!.textLabel?.text = "اللغة العربية"
        default: cell!.textLabel?.text = "Undefine"
        }
        
        return cell!
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedMenuItem = (indexPath as NSIndexPath).row
        
        switch ((indexPath as NSIndexPath).row) {
        case 0:
            SetLanguage(Lang.en)
        case 1:
            SetLanguage(Lang.fr)
        case 2:
            SetLanguage(Lang.es)
        case 3:
            SetLanguage(Lang.it)
        case 4:
            SetLanguage(Lang.ru)
        case 5:
            SetLanguage(Lang.zh)
        case 6:
            SetLanguage(Lang.ja)
        case 7:
            SetLanguage(Lang.ar)
        default:
            SetLanguage(Lang.en)
        }
        
        super.popSelf()
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
}

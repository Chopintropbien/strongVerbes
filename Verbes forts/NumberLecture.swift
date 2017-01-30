//
//  numberLecture.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 27/01/2017.
//  Copyright © 2017 Lauriane Mollier. All rights reserved.
//

import UIKit

class NumberLecture: SettingsTableViewController {
    
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let nbLec = Setting.numberLecture()
        switch nbLec {
        case 10:
            selectedMenuItem = 5
        case 15:
            selectedMenuItem = 6
        case 20:
            selectedMenuItem = 7
        default:
            selectedMenuItem = nbLec - 1
        }
    }
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
        
        let nbLec = Setting.numberLecture()
        switch nbLec {
        case 10:
            selectedMenuItem = 5
        case 15:
            selectedMenuItem = 6
        case 20:
            selectedMenuItem = 7
        default:
            selectedMenuItem = nbLec - 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = Localization("Number of reading")
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
        return 8
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        
        if (cell == nil) {
            cell = createCell()
        }
        
        switch((indexPath as NSIndexPath).row){
        case 0:
            cell!.textLabel?.text = "1"
        case 1:
            cell!.textLabel?.text = "2"
        case 2:
            cell!.textLabel?.text = "3"
        case 3:
            cell!.textLabel?.text = "4"
        case 4:
            cell!.textLabel?.text = "5"
        case 5:
            cell!.textLabel?.text = "10"
        case 6:
            cell!.textLabel?.text = "15"
        case 7:
            cell!.textLabel?.text = "20"
        default: cell!.textLabel?.text = "1"
        }
        
        return cell!
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMenuItem = (indexPath as NSIndexPath).row
        
        switch ((indexPath as NSIndexPath).row) {
        case 0:
            Setting.numberLecture(nbLect: 1)
        case 1:
            Setting.numberLecture(nbLect: 2)
        case 2:
            Setting.numberLecture(nbLect: 3)
        case 3:
            Setting.numberLecture(nbLect: 4)
        case 4:
            Setting.numberLecture(nbLect: 5)
        case 5:
            Setting.numberLecture(nbLect: 10)
        case 6:
            Setting.numberLecture(nbLect: 15)
        case 7:
            Setting.numberLecture(nbLect: 20)
        default:
            Setting.numberLecture(nbLect: 1)
        }
        
        super.popSelf()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

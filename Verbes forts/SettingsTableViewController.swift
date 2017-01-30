//
//  SettingsTableViewController.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 27/01/2017.
//  Copyright © 2017 Lauriane Mollier. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    
    var selectedMenuItem : Int
    
    override init(style: UITableViewStyle) {
        selectedMenuItem = -1
        super.init(style: style)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        selectedMenuItem = -1
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize apperance of table view
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = basicBackgroundColor
        tableView.scrollsToTop = false
        
        // Preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        tableView.selectRow(at: IndexPath(row: selectedMenuItem, section: 0), animated: false, scrollPosition: .middle)
    }
    
    
    
    func popSelf(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
            else{
                //Present new view controller
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
                var destViewController : UIViewController
                
                destViewController = mainStoryboard.instantiateViewController(withIdentifier: "ChooseLevel")
                self.sideMenuController()?.setContentViewController(destViewController)
            }
        }
    }
    
    func createCell() -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "CELL")
        cell.textLabel?.textColor = UIColor.darkGray
        let selectedBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: cell.frame.size.width, height: cell.frame.size.height))
        selectedBackgroundView.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        cell.selectedBackgroundView = selectedBackgroundView
        
        return cell
    }
    
    
    
}

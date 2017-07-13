//
//  MenuViewController.swift
//  Menu
//
//  Created by Tran Thien Khiem on 13/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    /// the list of restaurant
    var menuItems = [
        MenuItem(name: "Chicken Rice", price: 9.90, photo: "", information: "", count: 0),
        MenuItem(name: "Rice Chicken", price: 10.5, photo: "", information: "", count: 0),
        MenuItem(name: "Tomato", price: 5.0, photo: "", information: "", count: 0)
    ]
    
    @IBOutlet weak var bottomLayout: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewCartButton: UIButton!
    
    // view did load
    override func viewDidLoad() {
        updateState()
    }
    
    // update animation
    func updateState() {
        let price = menuItems.reduce(0) { $0 + Float($1.count) * $1.price}
        self.bottomLayout?.constant = price > 0.0 ? 0.0 : -50.0
        
        UIView.animate {
            self.view.layoutIfNeeded()
        }
        
        viewCartButton.setTitle("View Cart $\(price)", for: .normal)
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    // return number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    // return the cell for table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuItemCell;
        let item = menuItems[indexPath.row]
        
        cell.item = item
        
        return cell
    }
    
    // did select row at
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var newItem = menuItems[indexPath.row]
        newItem.count = newItem.count + 1
        menuItems[indexPath.row] = newItem
        
        tableView.deselectRow(at: indexPath, animated: false)
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        updateState()
    }
    
    /// can edit row
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        let item = menuItems[indexPath.row]
        return item.count > 0
    }
    
    //
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Remove"
    }
    
    // when delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var newItem = menuItems[indexPath.row]
            newItem.count = 0
            menuItems[indexPath.row] = newItem
            
            tableView.reloadData()
            updateState()
        }
    }
}
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
        MenuItem(name: "Food Republic", price: 250, photo: "", information: "", count: 0),
        MenuItem(name: "Food Republic", price: 250, photo: "", information: "", count: 0),
        MenuItem(name: "Food Republic", price: 250, photo: "", information: "", count: 0)
    ]
    
}

extension MenuViewController: UITableViewDataSource {
    // return number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "MenuCell")!
    }
}

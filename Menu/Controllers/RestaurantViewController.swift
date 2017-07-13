//
//  RestaurantViewController.swift
//  Menu
//
//  Created by Tran Thien Khiem on 13/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import UIKit

class RestaurantViewController: UITableViewController {
    
    /// the list of restaurant
    var restaurants = [
        Restaurant(name: "Food Republic", distance: 250, photo: ""),
        Restaurant(name: "Food Republic", distance: 250, photo: ""),
        Restaurant(name: "Food Republic", distance: 250, photo: "")
    ]
    
    // return number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "RestaurantCell")!
    }

}

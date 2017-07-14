//
//  RestaurantViewController.swift
//  Menu
//
//  Created by Tran Thien Khiem on 13/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import UIKit

class RestaurantViewController: UITableViewController {
    
    /// food api client
    var api = FoodApiClient()
    
    /// the list of restaurant
    var restaurants: [Restaurant] = [
    ]
    
    /// view already load
    override func viewDidLoad() {
        api.getRestaurants().then(success: restaurantLoaded)
    }
    
    
    /// set restaurants when loaded
    ///
    /// - Parameter restaurant: restaurant
    func restaurantLoaded(restaurants: [Restaurant]) {
        self.restaurants = restaurants
        tableView.reloadData()
    }
    
    
    /// Prepare for segue- pass restaurant to menu controller
    ///
    /// - Parameters:
    ///   - segue: the segue
    ///   - sender: sender, supposed to be the table cell
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowRestaurant" {
            if let cell = sender as? RestaurantCell,
                let controller = segue.destination as? MenuViewController {
                controller.restaurant = cell.restaurant
            }
        }
    }
    
    // return number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        cell.restaurant = restaurants[indexPath.row]
        return cell
    }

}

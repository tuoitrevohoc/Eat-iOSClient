//
//  File.swift
//  Menu
//
//  Created by Tran Thien Khiem on 14/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import UIKit


class RestaurantCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var distanceLabel: UILabel?
    @IBOutlet weak var photoImageView: UIImageView?
    
    var restaurant: Restaurant? {
        didSet {
            if let restaurant = restaurant {
                nameLabel?.text = restaurant.name
                distanceLabel?.text = "\(restaurant.distance ?? 0) m"
                photoImageView?.load(photo: restaurant.photo)
            }
        }
    }
}

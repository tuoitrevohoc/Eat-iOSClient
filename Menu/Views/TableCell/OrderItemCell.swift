//
//  OrderItemCell.swift
//  Menu
//
//  Created by Tran Thien Khiem on 13/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import UIKit


/// the menu item cell
class OrderItemCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var priceLabel: UILabel?
    @IBOutlet weak var countLabel: UILabel?
    
    /// Menu item displayed on this
    var item: OrderItem! {
        didSet {
            nameLabel?.text = item.name
            priceLabel?.text = "$\(item.price * Float(item.count))"
            countLabel?.text = "\(item.count)"
        }
    }
    
    
}

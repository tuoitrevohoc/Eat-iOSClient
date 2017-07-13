//
//  MenuItemCell.swift
//  Menu
//
//  Created by Tran Thien Khiem on 13/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import UIKit


/// the menu item cell
class MenuItemCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var priceButton: UIButton!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var countView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    
    /// Menu item displayed on this
    var item: MenuItem! {
        didSet {
            nameLabel.text = item.name
            informationLabel.text = item.information
            priceButton.setTitle("$\(item.price)", for: .normal)
            countLabel.text = "\(item.count)"
            countView.isHidden = item.count == 0
        }
    }
    
    
}

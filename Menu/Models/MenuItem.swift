//
//  MenuItem.swift
//  Menu
//
//  Created by Tran Thien Khiem on 13/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import Foundation

/// menu item in a restaurant
struct MenuItem: Decodable {
    var name: String
    var price: Int
    var photo: String
    var information: String
    var count: Int
}

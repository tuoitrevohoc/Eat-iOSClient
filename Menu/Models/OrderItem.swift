//
//  OrderItem.swift
//  Menu
//
//  Created by Tran Thien Khiem on 13/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import Foundation

/// item to order
struct OrderItem: Codable {
    var name: String
    var price: Float
    var count: Int
}

//
//  HawkerCenter.swift
//  Menu
//
//  Created by Tran Thien Khiem on 13/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import Foundation

/// Data structure for storing a restaurant
struct Restaurant: Decodable {
    
    /// name of the restaurant
    var name: String
    
    /// distance
    var distance: Int? = 200
    
    /// photo
    var photo: String
    
    // id of the restaurant
    var id: String
}

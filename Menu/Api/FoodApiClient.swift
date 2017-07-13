//
//  FoodApiClient.swift
//  Menu
//
//  Created by Tran Thien Khiem on 13/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import Foundation


struct FoodApiClient {
    
    let client = HttpClient(base: "")
    
    /// Order foods
    ///
    /// - Parameter items: list of items to order
    func order(items: [MenuItem]) -> NetworkPromise {
        return client.post("/api/order", body: items)
    }
    
    /// Check if the order is ready
    ///
    /// - Parameter id: id of the order
    /// - Returns: true or false
    func checkOrder(id: String) -> NetworkPromise {
        return client.get("/api/order/\(id)")
    }
}

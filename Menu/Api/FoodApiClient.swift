//
//  FoodApiClient.swift
//  Menu
//
//  Created by Tran Thien Khiem on 13/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import UIKit


/// log error to console
///
/// - Parameter error: <#error description#>
func logError(error: Error)  {
    print("Error occured")
    print(error)
}

// the food api client
struct FoodApiClient {
    
    let client = HttpClient(base: "https://sitneatapi.azurewebsites.net")
    
    
    /// initialize and set error handler
    init() {
        client.onError(handler: logError)
    }
    
    /// Order foods
    ///
    /// - Parameter items: list of items to order
    func order(items: [OrderItem]) -> NetworkPromise {
        return client.put("/api/orders", body: items)
    }
    
    /// Check if the order is ready
    ///
    /// - Parameter id: id of the order
    /// - Returns: true or false
    func checkOrder(id: String) -> NetworkPromise {
        return client.get("/api/orders/\(id)/isReady")
    }
    
    
    /// get all restaurant
    ///
    /// - Returns: list of restaurants
    func getRestaurants() -> NetworkPromise {
        return client.get("/api/restaurants")
    }
    
    
    /// get menu of the restaurant
    ///
    /// - Parameter restaurantId: the restaurant id
    /// - Returns: list of menu items
    func getMenu(restaurantId: String) -> NetworkPromise {
        return client.get("/api/restaurants/\(restaurantId)/menu")
    }
}

// loading image from url
extension UIImageView {
    
    /// Load image from a remote url
    ///
    /// - Parameter photo: <#photo description#>
    func load(photo: String) {
        let client = HttpClient(base: "")
        client.onError(handler: logError)
        client.get(photo)
            .then(success: setPhoto)
    }
    
    
    /// set photo using data
    ///
    /// - Parameter data: <#data description#>
    func setPhoto(data: Data) {
        if let image = UIImage(data: data) {
            self.image = image
        }
    }
        
}


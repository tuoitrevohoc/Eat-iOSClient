//
//  QueueViewController.swift
//  Menu
//
//  Created by Tran Thien Khiem on 14/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import UIKit

/// Queue View Controller
class QueueViewController: UIViewController {
    
    
    /// list of ordered items
    var orderItems: [OrderItem]?
    var orderId: String?
    @IBOutlet weak var queueNumberLabel: UIView!
    
    @IBOutlet weak var confirmedLabel: UIView!
    @IBOutlet weak var foodReadyLabel: UIView!
    @IBOutlet weak var closeButton: UIButton!
    
    let api = FoodApiClient()
    
    /// process order
    override func viewDidLoad() {
        
        queueNumberLabel.pullIn()
        
        if let orderItems = orderItems {
            api.order(items: orderItems)
                .then(success: orderCompleted)
        }
    }
    
    /// Order has been completed
    ///
    /// - Parameter id: the order id
    func orderCompleted(id: String)  {
        orderId = id
        
        confirmedLabel.pullIn()
        
        // start checking order status
    }
}

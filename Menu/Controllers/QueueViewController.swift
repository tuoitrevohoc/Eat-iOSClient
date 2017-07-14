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
    
    @IBOutlet weak var foodStatusView: UIView!
    @IBOutlet weak var confirmedView: UIView!
    @IBOutlet weak var foodReadyView: UIView!
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
        
        confirmedView.pullIn()
        checkOrderStatus()
        // start checking order status
    }
    
    
    /// Check the order status
    func checkOrderStatus() {
        api.checkOrder(id: orderId!)
            .then(success: onStatusUpdate)
    }
    
    /// status update got from server
    func onStatusUpdate(isReady: Bool) {
        if isReady {
            foodReadyView.pullIn()
            closeButton.pullIn()
            
            UIView.animate {
                self.view.backgroundColor = UIColor.green
            }
            
        } else {
            if foodStatusView.isHidden {
                foodStatusView.pullIn()
            }
            
            /// try again in 5 minutes
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: checkOrderStatus)
            
        }
    }
    
}

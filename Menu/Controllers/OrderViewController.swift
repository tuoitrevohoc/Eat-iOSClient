//
//  OrderViewController.swift
//  Menu
//
//  Created by Tran Thien Khiem on 13/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import UIKit

enum MenuTableSection: Int {
    case orderItemSection
    case creditCardSection
}

/// The order view controller
class OrderViewController: UIViewController {
    
    /// list of the order
    var orders: [OrderItem]!
    
    /// the credit card info
    var creditCardInfo: CreditCardInfo?
    
    @IBOutlet weak var bottomLayout: NSLayoutConstraint?
    @IBOutlet weak var tableView: UITableView?
    
    // view did load
    override func viewDidLoad() {
        updateState()
    }
    
    // update animation
    func updateState() {
        self.bottomLayout?.constant = creditCardInfo != nil ? 0.0 : -50.0
        
        UIView.animate {
            self.view.layoutIfNeeded()
        }
    }
    
    
    /// credit card form closed and return to this form
    ///
    /// - Parameter segue: the segue
    @IBAction func creditCardFormClosed(segue: UIStoryboardSegue) {
        if let creditCardViewController = segue.source as? CreditCardViewController {
            creditCardInfo = creditCardViewController.creditCardInfo
            updateState()
            tableView?.reloadData()
        }
    }
}

extension OrderViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    /// return number of session in table view
    ///
    /// - Parameter tableView: the target table view
    /// - Returns: number of section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    /// get number of cell in table
    ///
    /// - Parameters:
    ///   - tableView: the target table view
    ///   - section: the section
    /// - Returns: number of rows in that section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var result = 0
        
        switch section {
        case MenuTableSection.orderItemSection.rawValue:
            result = orders.count + 1
        default:
            result = 1
        }
        
        return result
    }
    
    /// Get cell for order
    ///
    /// - Parameters:
    ///   - tableView: target tablevie
    ///   - indexPath: the indexpath
    /// - Returns: the table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var result: UITableViewCell;
        
        if indexPath.section == MenuTableSection.orderItemSection.rawValue {
            var cellIdentifier = "OrderCell"
            let isTotalCell = indexPath.row == orders.count
            
            if isTotalCell {
                cellIdentifier = "OrderCellTotal"
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! OrderItemCell
            
            if isTotalCell {
                let totalItem = orders.reduce(OrderItem(name: "Total", price: 0.0, count: 1)) {
                    (result, next) in
                    var nextResult = result
                    nextResult.price = result.price + Float(next.count) * next.price
                    
                    return nextResult
                }
                
                cell.item = totalItem
            } else {
                cell.item = orders[indexPath.row]
            }
            
            result = cell
        } else {
            if creditCardInfo != nil {
                result = tableView.dequeueReusableCell(withIdentifier: "CreditCardCell")!
            } else {
                result = tableView.dequeueReusableCell(withIdentifier: "NoCreditCardCell")!
            }
        }
        
        return result
    }
    
    
    /// Check if a row is editable
    ///
    /// - Parameters:
    ///   - tableView: the target tableview
    ///   - indexPath: <#indexPath description#>
    /// - Returns: <#return value description#>
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 0 && indexPath.row < orders.count
    }
    
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - tableView: <#tableView description#>
    ///   - editingStyle: <#editingStyle description#>
    ///   - indexPath: <#indexPath description#>
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            orders.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
}

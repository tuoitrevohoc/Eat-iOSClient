//
//  CreditCardViewController.swift
//  Menu
//
//  Created by Tran Thien Khiem on 13/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import UIKit

/// View controller
class CreditCardViewController: UIViewController {
    
    @IBOutlet weak var creditCardImage: UIImageView!
    
    @IBOutlet weak var cardNumberInput: UITextField!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var expirationInput: UITextField!
    @IBOutlet weak var ccvInput: UITextField!
    
    var creditCardInfo: CreditCardInfo?
    
    var isFront: Bool = true {
        willSet {
            
            if isFront != newValue {
                let image = UIImage(named: newValue ? "Front" : "Back")!
                
                UIView.animate(animation: {
                    self.creditCardImage.transform = CGAffineTransform(scaleX: 0.001, y: 1.0)
                }, completion: {_ in
                    self.creditCardImage.image = image
                    
                    UIView.animate {
                        self.creditCardImage.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    }
                })
            }
            
        }
    }
    
    
    /// Should perform for segue
    ///
    /// - Parameters:
    ///   - identifier: the identifier
    ///   - sender: sender
    /// - Returns: if can cancel or not
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var result = true
        
        if identifier == "ConfirmCreditCard" {
            
            if nameInput.text?.count == 0
                || cardNumberInput.text?.count != 12
                || expirationInput.text?.count == 0
                || ccvInput.text?.count != 3 {
                
                result = false
            } else {
                creditCardInfo = CreditCardInfo(name: nameInput.text!,
                               number: cardNumberInput.text!,
                               expired: expirationInput.text!,
                               ccv: ccvInput.text!)
            }
        }
        
        return result
    }
    
}


// MARK: - credit card text field delegate
extension CreditCardViewController: UITextFieldDelegate {
    
    
    /// begin edit
    ///
    /// - Parameter textField: the text field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        isFront = textField != ccvInput
    }
}

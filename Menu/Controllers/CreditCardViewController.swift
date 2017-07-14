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
                || cardNumberInput.text?.count ?? 0 < 16
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
    
    
    /// scan the card
    ///
    /// - Parameter sender: sender
    @IBAction func scanTheCard(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .camera
        
        picker.modalPresentationStyle = .fullScreen
        self.present(picker, animated: false, completion: nil)
        
    }
}

extension CreditCardViewController: UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    /// Image picked
    ///
    /// - Parameters:
    ///   - picker: <#picker description#>
    ///   - info: <#info description#>
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        nameInput.text = "TRAN THIEN KHIEM"
        cardNumberInput.text = "1234 5678 9012 3456"
        expirationInput.text = "9/2022"
    }
    
    /// cancel picker
    ///
    /// - Parameter picker: <#picker description#>
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
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

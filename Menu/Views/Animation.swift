//
//  Animation.swift
//  Menu
//
//  Created by Tran Thien Khiem on 13/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import UIKit


extension UIView {
    static func animate(animation: @escaping () -> ())  {
        return UIView.animate(withDuration: 0.25,
                              delay: 0.0,
                              usingSpringWithDamping: 0.5,
                              initialSpringVelocity: 1.0,
                              options: .curveLinear,
                              animations: animation,
                              completion: nil)
    }
    
    static func animate(animation: @escaping () -> (), completion: @escaping (Bool) -> ())  {
        return UIView.animate(withDuration: 0.25,
                              delay: 0.0,
                              usingSpringWithDamping: 0.5,
                              initialSpringVelocity: 1.0,
                              options: .curveLinear,
                              animations: animation,
                              completion: completion)
    }
}


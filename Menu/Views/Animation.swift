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
        return UIView.animate(withDuration: 0.5,
                              delay: 0.0,
                              usingSpringWithDamping: 0.5,
                              initialSpringVelocity: 1.0,
                              options: .curveEaseIn,
                              animations: animation,
                              completion: nil)
    }
}


//
//  GcdUtils.swift
//  Menu
//
//  Created by Tran Thien Khiem on 12/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import UIKit

/// run this block on main queue
func runOnMain(_ block: @escaping () -> Void) {
    OperationQueue.main.addOperation(block)
}

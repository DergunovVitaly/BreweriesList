//
//  MBProgressHUD+Ext.swift
//
//
//  Created by Vitalii Derhunov on 25.10.2019.
//  Copyright © 2019 Vitalii Derhunov. All rights reserved.
//

import MBProgressHUD
import UIKit

var AssociatedObjectHandle: UInt8 = 0

extension MBProgressHUD {
    
    static func showProgress(on viewController: UIViewController?) {
        guard let VC = viewController else { return }
        MBProgressHUD.showAdded(to: VC.view, animated: true)
        increaseActivity(view: VC.view)
    }
    
    static func hideProgress(for viewController: UIViewController?) {
        guard let VC = viewController else { return }
        decreaseActivity(view: VC.view)
        if getCurrentActivity(view: VC.view) == 0 {
            MBProgressHUD.hide(for: VC.view, animated: true)
        }
    }
    
    static func showProgress(on view: UIView) {
        MBProgressHUD.showAdded(to: view, animated: true)
        increaseActivity(view: view)
    }
    
    static func hideProgress(for view: UIView) {
        decreaseActivity(view: view)
        if getCurrentActivity(view: view) == 0 {
            MBProgressHUD.hide(for: view, animated: true)
        }
    }
    
    // MARK: - Private methods
    
    static func increaseActivity(view: UIView) {
        setActivity(value: getCurrentActivity(view: view) + 1, view: view)
    }
    
    static func decreaseActivity(view: UIView) {
        let currentValue = getCurrentActivity(view: view)
        let newValue = currentValue == 0 ? 0 : currentValue - 1
        setActivity(value: newValue, view: view)
    }
    
    static func getCurrentActivity(view: UIView) -> Int {
        let currentValue = objc_getAssociatedObject(view, &AssociatedObjectHandle) as? Int
        return currentValue ?? 0
    }
    
    static func setActivity(value: Int, view: UIView) {
        objc_setAssociatedObject(view, &AssociatedObjectHandle, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

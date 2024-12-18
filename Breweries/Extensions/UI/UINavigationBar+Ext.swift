//
//  UINavigationBar+Ext.swift
//  
//
//  Created by Vitalii Derhunov on 25.10.2019.
//  Copyright © 2019 Vitalii Derhunov. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func makeTranslucent() {
        self.isTranslucent = true
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
    }
}

extension UIToolbar {
    func makeTranslucent() {
        self.isTranslucent = true
        self.setBackgroundImage(UIImage(), forToolbarPosition: .any, barMetrics: .default)
        self.setShadowImage(UIImage(), forToolbarPosition: .any)
    }
}

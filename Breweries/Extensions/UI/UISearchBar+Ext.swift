//
//  UISearchBar+Ext.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 16.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar {
    
    func setupSearchBar() {
        if #available(iOS 13.0, *) {
            searchTextField.backgroundColor = .white
            searchTextField.tintColor = R.color.darkGrassGreen()
        } else {
            guard let subviewsFirst = subviews.first else { return }
            for textField in subviewsFirst.subviews where textField is UITextField {
                textField.subviews.first?.backgroundColor = .white
                textField.subviews.first?.layer.cornerRadius = 10.5
                textField.subviews.first?.layer.masksToBounds = true
                textField.tintColor = R.color.darkGrassGreen()
            }
        }
    }
}

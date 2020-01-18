//
//  UILabel+Ext.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 17.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import UIKit
import Foundation

extension UILabel {
    
    func addPrefixWithSpecialColorOnLabel(text: String, prefix: String, color: UIColor) {
        self.attributedText = text.add(prefix: prefix).attributedStringForPartiallyColoredText(prefix, with: color)
    }
}

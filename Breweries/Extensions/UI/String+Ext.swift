//
//  String+Ext.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 17.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func add(prefix: String) -> String {
        return prefix + self
    }
    
    func add(postfix: String) -> String {
        return self + postfix
    }
    
    func attributedStringForPartiallyColoredText(_ textToFind: String, with color: UIColor) ->
        NSMutableAttributedString {
            let mutableAttributedstring = NSMutableAttributedString(string: self)
            let range = mutableAttributedstring.mutableString.range(of: textToFind, options: .caseInsensitive)
            if range.location != NSNotFound {
                mutableAttributedstring.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
            }
            return mutableAttributedstring
    }
}

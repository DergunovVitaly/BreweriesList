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
 
    func setCenteredPlaceHolder() {
        
        showsCancelButton = false
        
        let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
        
        let searchBarWidth = self.frame.width
        let placeholderIconWidth = textFieldInsideSearchBar?.leftView?.frame.width
        let placeHolderWidth = textFieldInsideSearchBar?.attributedPlaceholder?.size().width
        let offsetIconToPlaceholder: CGFloat = 8
        let placeHolderWithIcon = placeholderIconWidth! + offsetIconToPlaceholder
        
        let offset = UIOffset(horizontal: ((searchBarWidth / 2) - (placeHolderWidth! / 2) - placeHolderWithIcon), vertical: 0)
        self.setPositionAdjustment(offset, for: .search)
    }
    
    func setupSearchBar() {
        if #available(iOS 13.0, *) {
            searchTextField.backgroundColor = .white
            searchTextField.tintColor = R.color.darkGrassGreen()
            
        } else {
            for textField in subviews.first!.subviews where textField is UITextField {
                textField.subviews.first?.backgroundColor = .white
                textField.subviews.first?.layer.cornerRadius = 10.5
                textField.subviews.first?.layer.masksToBounds = true
                textField.tintColor = R.color.darkGrassGreen()
                
            }
        }
    }
}

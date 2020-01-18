//
//  UIViewController+Ext.swift
//  
//
//  Created by Vitalii Derhunov on 25.10.2019.
//  Copyright © 2019 Vitalii Derhunov. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setApperanceForNavBar(backgroundColor: UIColor?) {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = backgroundColor
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = backgroundColor
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationItem.standardAppearance = appearance
            navigationItem.scrollEdgeAppearance = appearance
        }
    }
}

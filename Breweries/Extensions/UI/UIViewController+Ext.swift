//
//  UIViewController+Ext.swift
//  
//
//  Created by Vitalii Derhunov on 25.10.2019.
//  Copyright © 2019 Vitalii Derhunov. All rights reserved.
//

import UIKit

extension UIViewController {
    var isModal: Bool {
        if presentingViewController != nil {
            return true
        } else if navigationController?.presentingViewController?.presentedViewController == navigationController {
            return true
        } else if tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        return false
    }

    func close(animated: Bool = true) {
        guard isModal else {
            navigationController?.popViewController(animated: animated)
            return
        }
        dismiss(animated: animated)
    }
    func setApperanceForNavBar() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = R.color.darkGrassGreen()
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
            navigationItem.standardAppearance = appearance
            navigationItem.scrollEdgeAppearance = appearance
            navigationController?.navigationBar.tintColor = .white
        }
    }
}

extension UITraitEnvironment {
    func handleUserStyleChange(from fromTraits: UITraitCollection?,
                               toTraits: UITraitCollection,
                               handler: (() -> Void)) {
        guard #available(iOS 12.0, *) else { return }
        guard let previousTraitCollection = fromTraits else { return }
        guard toTraits.userInterfaceStyle != previousTraitCollection.userInterfaceStyle else { return }
        handler()
    }
}

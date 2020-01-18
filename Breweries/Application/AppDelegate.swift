//
//  AppDelegate.swift
//
//
//  Created by Vitalii Derhunov on 8/8/19.
//  Copyright © 2019 Vitalii Derhunov. All rights reserved.
//

import UIKit
import SnapKit
import Closures

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: BreweriesListViewController())
        return true
    }
}

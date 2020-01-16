//
//  AppDelegate.swift
//
//
//  Created by Vitalii Derhunov on 8/8/19.
//  Copyright © 2019 Vitalii Derhunov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        VendorService.start(options: launchOptions)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        AppRouter().newState(.start)
        return true
    }
}

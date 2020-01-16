//
//  AppRouter.swift
//
//
//  Created by Vitalii Derhunov on 20.08.2019.
//  Copyright © 2019 Vitalii Derhunov. All rights reserved.
//

import Foundation
import UIKit

enum NavigationState {
    case start
    case debug
    case none
}

class AppRouter {
    
    let window = UIApplication.shared.keyWindow
    
    func newState(_ state: NavigationState) {
        switch state {
        case .start:
            window?.rootViewController = StartVC()
        case .debug:
            window?.rootViewController = DebugVC()
        default:
            window?.rootViewController = StartVC()
        }
    }
}

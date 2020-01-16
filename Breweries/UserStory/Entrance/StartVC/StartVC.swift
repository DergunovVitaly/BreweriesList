//
//  StartVC.swift
//
//
//  Created by Vitalii Derhunov on 25.10.2019.
//  Copyright © 2019 Vitalii Derhunov. All rights reserved.
//

import Foundation
import UIKit

class StartVC: UIViewController {
    
    private let contentView = StartView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if DebugSettings.isDebug {
            AppRouter().newState(.debug)
            return
        }
    }
}

//
//  BreweryUILabel.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 18.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import Foundation
import UIKit

class BreweryUILabel: UILabel {
    
   private let labelFont: UIFont = .systemFont(ofSize: 10, weight: .medium)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = labelFont
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

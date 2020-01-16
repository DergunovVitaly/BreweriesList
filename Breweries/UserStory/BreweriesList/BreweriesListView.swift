//
//  BreweriesListView.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 16.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import UIKit

class BreweriesListView: UIView {
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 70
        tableView.backgroundColor = .white
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

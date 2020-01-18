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
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        backgroundColor = .white
        
        addSubview(imageView)
        imageView.image = R.image.manWithBear()
        imageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 145, height: 245))
            make.bottom.trailing.equalToSuperview()
        }
        
        tableView.register(BreweriesListCell.self, forCellReuseIdentifier: String(describing: BreweriesListCell.self))
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 70
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)
        tableView.showsVerticalScrollIndicator = false
        
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

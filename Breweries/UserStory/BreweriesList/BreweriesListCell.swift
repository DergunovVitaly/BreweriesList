//
//  BreweriesListCell.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 16.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import UIKit

class BreweriesListCell: UITableViewCell {
    
    private let backgroundContentView = UIView()
    private let breweryNameLabel = UILabel()
    private let breweryPhoneNumberLabel = UILabel()
    private let breweryWebSiteLabel = UILabel()
    private let breweryCityLabel = UILabel()
    private let breweryStreetLabel = UILabel()
    private let breweryCountryLabel = UILabel()
    private let showOnMapButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(viewModel: BreweryModelElement) {
        breweryNameLabel.text = viewModel.name
        breweryPhoneNumberLabel.addPrefixWithSpecialColorOnLabel(text: viewModel.phone ?? "",
                                                                 prefix: Localizable.phone(),
                                                                 color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        breweryCityLabel.addPrefixWithSpecialColorOnLabel(text: viewModel.city ?? "",
                                                          prefix: Localizable.city(),
                                                          color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        breweryCountryLabel.addPrefixWithSpecialColorOnLabel(text: viewModel.country ?? "",
                                                             prefix: Localizable.country(),
                                                             color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    }
    
    private func setupLayout() {
        
        selectionStyle = .none
        backgroundContentView.layer.borderColor = R.color.darkGrassGreen()?.cgColor
        backgroundContentView.layer.borderWidth = 1
        backgroundContentView.layer.cornerRadius = 10
        backgroundContentView.backgroundColor = R.color.white()
        
        contentView.addSubview(backgroundContentView)
        backgroundContentView.snp.makeConstraints { (make) in
             make.edges.equalTo(UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12))
        }
        
        breweryNameLabel.font = R.font.iowanOldStyleBold(size: 16)
        breweryNameLabel.numberOfLines = 0
        backgroundContentView.addSubview(breweryNameLabel)
        breweryNameLabel.snp.makeConstraints { (make) in
            make.top.trailing.equalToSuperview().inset(11)
            make.leading.equalToSuperview().offset(16)
        }
        
        breweryPhoneNumberLabel.font = .systemFont(ofSize: 10, weight: .medium)
        backgroundContentView.addSubview(breweryPhoneNumberLabel)
        breweryPhoneNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(breweryNameLabel.snp.bottom).offset(2)
            make.leading.equalTo(breweryNameLabel)
        }
        
        breweryCountryLabel.font = .systemFont(ofSize: 10, weight: .medium)
        backgroundContentView.addSubview(breweryCountryLabel)
        breweryCountryLabel.snp.makeConstraints { (make) in
                  make.top.equalTo(breweryPhoneNumberLabel.snp.bottom).offset(4)
                  make.leading.equalTo(breweryPhoneNumberLabel)
                  make.bottom.equalToSuperview().offset(-10)
              }
        
//        breweryCityLabel.font = .systemFont(ofSize: 10, weight: .medium)
//        backgroundContentView.addSubview(breweryCityLabel)
//        breweryCityLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(breweryPhoneNumberLabel.snp.bottom).offset(4)
//            make.leading.equalTo(breweryPhoneNumberLabel)
//            make.bottom.equalToSuperview().offset(-10)
//        }
//
//        breweryStreetLabel.font = .systemFont(ofSize: 10, weight: .medium)
        
    }
}

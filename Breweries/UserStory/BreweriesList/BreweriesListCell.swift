//
//  BreweriesListCell.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 16.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import UIKit
import CoreLocation

protocol BreweriesListCellDelegate: class {
    func tapOnShowOnMapButtonEvent(latitudeString: String, longitudeString: String)
    func tapOnWebSiteLabelEvent(url: URL)
}

class BreweriesListCell: UITableViewCell {
    
    private var breweryURL: URL?
    private var latitudeString: String?
    private var longitudeString: String?
    private let backgroundContentView = UIView()
    private let breweryNameLabel = UILabel()
    private let breweryPhoneNumberLabel = BreweryUILabel()
    private let breweryWebSiteLabel = BreweryUILabel()
    private let breweryCountryLabel = BreweryUILabel()
    private let breweryStateLabel = BreweryUILabel()
    private let breweryCityLabel = BreweryUILabel()
    private let breweryStreetLabel = BreweryUILabel()
    private let showOnMapButton = UIButton()
    
    weak var delegate: BreweriesListCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(viewModel: BreweryModelElement) {
        breweryNameLabel.text = viewModel.name
        breweryPhoneNumberLabel.addCustomColorTo(text: viewModel.phone ?? "",
                                                 prefix: Localizable.phone(),
                                                 color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        breweryCityLabel.addCustomColorTo(text: viewModel.city ?? "",
                                          prefix: Localizable.city(),
                                          color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        breweryCountryLabel.addCustomColorTo(text: viewModel.country ?? "",
                                             prefix: Localizable.country(),
                                             color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        breweryStateLabel.addCustomColorTo(text: viewModel.state ?? "",
                                           prefix: Localizable.state(),
                                           color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        breweryStreetLabel.addCustomColorTo(text: viewModel.street ?? "",
                                            prefix: Localizable.street(),
                                            color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        breweryWebSiteLabel.addCustomColorTo(text: viewModel.websiteURL ?? "",
                                             prefix: Localizable.webSite(),
                                             color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        
        //TODO: Check for an empty value, such a response from the server
        breweryWebSiteLabel.isHidden = viewModel.websiteURL == ""
        breweryPhoneNumberLabel.isHidden = viewModel.phone == ""
        breweryCityLabel.isHidden = viewModel.city == ""
        breweryCountryLabel.isHidden = viewModel.country == ""
        breweryStateLabel.isHidden = viewModel.state == ""
        breweryStreetLabel.isHidden = viewModel.street == ""
        showOnMapButton.isHidden = viewModel.latitude == ""
        
        breweryURL = URL(string: viewModel.websiteURL ?? "")
        latitudeString = viewModel.latitude
        longitudeString = viewModel.longitude
    }
    
    private func setupLayout() {
       
        backgroundColor = .clear
        selectionStyle = .none
        backgroundContentView.layer.borderColor = R.color.darkGrassGreen()?.cgColor
        backgroundContentView.layer.borderWidth = 1
        backgroundContentView.layer.cornerRadius = 10
        backgroundContentView.backgroundColor = R.color.white()
        breweryWebSiteLabel.isUserInteractionEnabled = true
    
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
        
        let stackView = UIStackView(arrangedSubviews: [breweryPhoneNumberLabel,
                                                       breweryWebSiteLabel,
                                                       breweryCountryLabel,
                                                       breweryStateLabel,
                                                       breweryCityLabel,
                                                       breweryStreetLabel])
        stackView.axis = .vertical
        stackView.spacing = 4.0
        stackView.alignment = .leading
        stackView.isUserInteractionEnabled = true
        backgroundContentView.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(breweryNameLabel.snp.bottom).offset(2)
            make.leading.equalTo(breweryNameLabel)
        }
        
        showOnMapButton.layer.cornerRadius = 5
        showOnMapButton.backgroundColor = R.color.darkGrassGreen()
        showOnMapButton.titleLabel?.font = .systemFont(ofSize: 10, weight: .medium)
        showOnMapButton.setTitle(Localizable.showOnMap(), for: .normal)
        backgroundContentView.addSubview(showOnMapButton)
        showOnMapButton.snp.makeConstraints { (make) in
            make.top.equalTo(stackView.snp.bottom).offset(6)
            make.size.equalTo(CGSize(width: 75, height: 21))
            make.leading.equalTo(stackView)
            make.bottom.equalToSuperview().offset(-13)
        }
        
        showOnMapButton.onTap { [unowned self] in
            guard let latitudeString = self.latitudeString, let longitudeString = self.longitudeString else { return }
            self.delegate?.tapOnShowOnMapButtonEvent(latitudeString: latitudeString, longitudeString: longitudeString)
        }
        
        breweryWebSiteLabel.addTapGesture { [unowned self] (_) in
            guard let url = self.breweryURL else { return }
            self.delegate?.tapOnWebSiteLabelEvent(url: url)
        }
    }
}

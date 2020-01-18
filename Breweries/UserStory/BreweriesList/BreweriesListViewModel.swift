//
//  BreweriesListViewModel.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 16.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import Foundation
import Moya

class BreweriesListViewModel {
    
//    let id: Int
//    let name: String?
//    let breweryType: String?
//    let street, city: String?
//    let state: String?
//    let postalCode: String?
//    let country: String?
//    let longitude, latitude, phone: String?
//    let websiteURL: String?
//    let updatedAt: String?
//
//    init(model: BreweryModelElement) {
//        self.id = model.id
//        self.name = model.name
//        self.breweryType = model.breweryType
//        self.street = model.street
//        self.city = model.city
//        self.state = model.state
//        self.country = model.country
//        self.latitude = model.latitude
//        self.longitude = model.longitude
//        self.phone = model.phone
//        self.websiteURL = model.websiteURL
//        self.updatedAt = model.updatedAt
//        self.postalCode = model.postalCode
//    }
}

extension BreweriesListViewModel: RequestFetch {
    func fetch(completion: @escaping (Result<BreweryModel, Error>) -> Void) {
        Request.fetch(completion: completion)
    }
}

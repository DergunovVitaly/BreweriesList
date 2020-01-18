//
//  BreweryModel.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 16.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import Foundation

struct BreweryModelElement: Codable {
    let id: Int
    let name: String?
    let breweryType: String?
    let street, city: String?
    let state: String?
    let postalCode: String?
    let country: String?
    let longitude, latitude, phone: String?
    let websiteURL: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case breweryType = "brewery_type"
        case street, city, state
        case postalCode = "postal_code"
        case country, longitude, latitude, phone
        case websiteURL = "website_url"
        case updatedAt = "updated_at"
    }
}

typealias BreweryModel = [BreweryModelElement]

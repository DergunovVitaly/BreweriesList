//
//  BreweryDataBaseModel.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 18.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import Foundation
import RealmSwift

class BreweryDataBaseModel: Object {
    @objc dynamic var id = 0
    @objc dynamic var name: String?
    @objc dynamic var breweryType: String?
    @objc dynamic var street: String?
    @objc dynamic var city: String?
    @objc dynamic var state: String?
    @objc dynamic var postalCode: String?
    @objc dynamic var country: String?
    @objc dynamic var longitude: String?
    @objc dynamic var latitude: String?
    @objc dynamic var phone: String?
    @objc dynamic var websiteURL: String?

    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func dataBaseModelFrom(model: BreweryModelElement) -> BreweryDataBaseModel {
        let newItem = BreweryDataBaseModel()
        newItem.breweryType = model.breweryType
        newItem.city = model.city
        newItem.country = model.country
        newItem.id = model.id
        newItem.latitude = model.latitude
        newItem.longitude = model.longitude
        newItem.name = model.name
        newItem.phone = model.phone
        newItem.street = model.street
        newItem.state = model.state
        newItem.websiteURL = model.websiteURL
        return newItem
    }
}

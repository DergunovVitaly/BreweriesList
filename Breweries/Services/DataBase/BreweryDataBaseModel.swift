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
    @objc dynamic var name = ""
    @objc dynamic var breweryType = ""
    @objc dynamic var street = ""
    @objc dynamic var city = ""
    @objc dynamic var state = ""
    @objc dynamic var postalCode = ""
    @objc dynamic var country = ""
    @objc dynamic var longitude = ""
    @objc dynamic var latitude = ""
    @objc dynamic var phone = ""
    @objc dynamic var websiteURL = ""
    @objc dynamic var updatedAt = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func dataBaseModelFrom(model: BreweryModelElement) -> BreweryDataBaseModel {
        let newItem = BreweryDataBaseModel()
        newItem.breweryType = model.breweryType ?? ""
        newItem.city = model.city ?? ""
        newItem.country = model.country ?? ""
        newItem.id = model.id
        newItem.latitude = model.latitude ?? ""
        newItem.longitude = model.longitude ?? ""
        newItem.name = model.name ?? ""
        newItem.phone = model.phone ?? ""
        newItem.street = model.street ?? ""
        newItem.state = model.state ?? ""
        newItem.websiteURL = model.websiteURL ?? ""
        return newItem
    }
}

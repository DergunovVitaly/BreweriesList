//
//  DataBaseService.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 18.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import Foundation
import RealmSwift

class DataBaseService {
    
    func writeToDataBase(breweryModel: BreweryModelElement) {
        DispatchQueue.global().async {
            guard let realm = try? Realm() else { return }
            let newItem = BreweryDataBaseModel.dataBaseModelFrom(model: breweryModel)
            try? realm.write {
                realm.add(newItem)
            }
        }
    }
    
    func readFromDataBase() -> BreweryModel {
        guard let realm = try? Realm() else { return [] }
        let breweries = realm.objects(BreweryDataBaseModel.self).sorted(byKeyPath: "createdAt", ascending: false)
        let items = breweries.map { BreweryModelElement.modelFromDataBse(model: $0) }
        return Array(items)
    }
}

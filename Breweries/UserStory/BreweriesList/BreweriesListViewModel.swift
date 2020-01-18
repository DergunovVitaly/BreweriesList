//
//  BreweriesListViewModel.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 16.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import Foundation
import Moya

class BreweriesListViewModel: RequestFetch {
    func search(name: String, completion: @escaping (Result<BreweryModel, Error>) -> Void) {
        Request.search(name: name, completion: completion)
    }
    
    func fetch(completion: @escaping (Result<BreweryModel, Error>) -> Void) {
        Request.fetch(completion: completion)
    }
    
}

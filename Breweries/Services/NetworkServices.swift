//
//  NetworkServices.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 16.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import Moya

enum NetworkService {
    case getBreweries
    case searchBreweries
}

extension NetworkService: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.openbrewerydb.org") else {
            fatalError("baseURL could not be configured")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getBreweries:
            return  "/breweries"
        case .searchBreweries:
            return "/breweries?by_name=%20{query}_"
        }
    }
    
    var method: Method {
        switch self {
        case .getBreweries, .searchBreweries:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getBreweries, .searchBreweries:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .getBreweries, .searchBreweries:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getBreweries, .searchBreweries:
            return ["Content-type": "application/json"]
        }
    }
}

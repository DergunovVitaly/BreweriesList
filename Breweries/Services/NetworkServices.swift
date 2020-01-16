//
//  NetworkServices.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 16.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import Moya

enum NetworkSirvice {
    case getBreweries
}

extension NetworkSirvice: TargetType {
    public var baseURL: URL {
        let url = URL(string: "https://api.openbrewerydb.org")
        return url!
    }
    
    public var path: String {
        "/breweries"
    }
    
    public var method: Method {
        .get
    }
    
    public var sampleData: Data {
        Data()
    }
    
    public var task: Task {
        .requestPlain
    }
    
    public var headers: [String : String]? {
        ["Content-type": "application/json"]
    }
}


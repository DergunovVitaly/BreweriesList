//
//  Request.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 16.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import Foundation
import Moya

protocol RequestFetch {
    func fetch(completion: @escaping (Result<BreweryModel, Error>) -> Void)
}

class Request {
    
    static func fetch(completion: @escaping (Result<BreweryModel, Error>) -> Void) {
        let provider = MoyaProvider<NetworkService>()
        provider.request(.getBreweries) { result in
            switch result {
            case .success(let response):
                response.statusCode == 200 ? print("✈️✈️✈️") : print(response.statusCode)
                do {
                    let brewery = try response.map(BreweryModel.self)
                    completion(.success(brewery))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
                debugPrint(error.errorDescription ?? "Unknown error")
            }
        }
    }
}

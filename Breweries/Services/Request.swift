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
    func search(name: String, completion: @escaping (Result<BreweryModel, Error>)
        -> Void)
}

class Request {
    
    static let provider = MoyaProvider<NetworkService>()
    
    static func fetch(completion: @escaping (Result<BreweryModel, Error>) -> Void) {
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
    
    static func search(name: String, completion: @escaping (Result<BreweryModel, Error>) -> Void) {
        provider.request(.searchBreweries(name)) { result in
            switch result {
            case .success(let response):
                do {
                    let brewery = try response.map(BreweryModel.self)
                    completion(.success(brewery))
                } catch {
                    
                }
            case .failure(let error):
                completion(.failure(error))
                debugPrint(error.errorDescription ?? "Unknown error")
            }
        }
    }
}

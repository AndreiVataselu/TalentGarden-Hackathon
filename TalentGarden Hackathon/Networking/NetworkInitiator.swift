//
//  NetworkInitiator.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import PromiseKit

class NetworkInitiator {
    enum FatalError: Error {
        case someError
    }
    
    static func getResponseOfType<T: Decodable>(request: Request) -> Promise<T> {
        return Promise { resolver in
            let decoder = JSONDecoder()
            _ = execute(request: request).map {
                guard let data = $0 else {
                    resolver.reject(FatalError.someError)
                    return
                }
                
                do {
                    let decodedObject = try decoder.decode(T.self, from: data)
                    resolver.fulfill(decodedObject)
                } catch {
                    resolver.reject(FatalError.someError)
                }
            }
        }
    }
    
    static func execute(request: Request) -> Promise<Data?> {
        return Promise { resolver in
            var url = request.url
            url.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            url.httpMethod = request.method.rawValue
            
            DispatchQueue.global().async {
                URLSession.shared.dataTask(with: url) { (dataRetrieved, response, error) in
                    guard error == nil else {
                        resolver.fulfill(nil)
                        return
                    }
                    resolver.fulfill(dataRetrieved)
                }.resume()
            }
        }
    }
}

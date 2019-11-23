//
//  NetworkInitiator.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation

class NetworkInitiator {
    static func execute(request: Request) {
        URLSession.shared.dataTask(with: request.url) { (dataRetrieved, response, error) in
            guard error == nil else {
                print("An error occured! \(String(describing: error?.localizedDescription))")
                return
            }
        }.resume()
    }
}

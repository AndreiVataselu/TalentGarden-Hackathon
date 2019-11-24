//
//  TransactionsRequest.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 24/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation

enum TransactionsRequest: Request {
    case getTransactions
    
    var path: String {
        return "/v1/accounts/99999ad90f9c99b999fe9999e9999e9f/transactions"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var header: [String : String] {
        return ["Content-Type": "application/json"]
    }
}

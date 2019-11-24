//
//  TransactionsManager.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 24/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import PromiseKit


class TransactionsManager {
    static let shared = TransactionsManager()
    var transactions: [Transaction] = []
    
    func getTransactions() {
        let transactionPromise: Promise<[Transaction]> = NetworkInitiator.getResponseOfType(request: TransactionsRequest.getTransactions)
        transactionPromise.map { myProfile.transactions = $0 }
    }
}

//
//  Transaction.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation

struct Transaction: Decodable {
    var transactionId: String?
    var bookingDate: String?
    var valueDate: String?
    var transactionCurrency: String?
    var transactionAmount: String?
    var creditorName: String?
    var debtorName: String?
    var transactionStatus: String?
    var remittanceInformationUnstructured: String?
    var creditorAccountIban: String?
    var debtorAccountIban: String?
    var merchant: String?
}

extension Transaction {
    func transactionAmountValue() -> Double {
        let transactionVal = Double(transactionAmount ?? "0.0") ?? 0
        return transactionVal < 0 ? transactionVal * -1 : transactionVal
    }
}

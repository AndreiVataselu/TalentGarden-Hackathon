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
}

//
//  ChallengeHeader.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit

class ChallengeHeader: UIView {
    @IBOutlet private weak var coinsBalanceLabel: UILabel!
    
    func configure(balance: Int) {
        coinsBalanceLabel.text = "\(balance)"
    }
}

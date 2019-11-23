//
//  ChallengeView.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit

class ChallengeView: UIView {
    @IBOutlet private weak var challengeNameLabel: UILabel!
    @IBOutlet private weak var challengeRewardLabel: UILabel!
    
    func configure(challenge: Challenge) {
        challengeNameLabel.text = challenge.name
        challengeRewardLabel.text = "\(challenge.reward)"
    }
    
}

class ChallengeTVC: GenericTVC<ChallengeView> {}

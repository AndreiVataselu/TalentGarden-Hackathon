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
        
        challengeNameLabel.alpha = challenge.locked ? 0.5 : 1
        challengeRewardLabel.alpha = challenge.locked ? 0.5 : 1
    }
    
}

class ChallengeTVC: GenericTVC<ChallengeView> {}

//
//  ChallengeTableHeader.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit

class ChallengeTableHeader: UIView {
    @IBOutlet private weak var accessoryImageView: UIImageView!
    @IBOutlet private weak var levelNameLabel: UILabel!
    
    
    func configure(levelName: String, locked: Bool) {
        levelNameLabel.text = levelName
        let unlockedImage = UIImage(named: "target") ?? UIImage()
        let lockedImage = UIImage(named: "padlock") ?? UIImage()
        accessoryImageView.image = locked ? lockedImage : unlockedImage
    }
}

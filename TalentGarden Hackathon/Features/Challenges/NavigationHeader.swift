//
//  ChallengeHeader.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit


class NavigationHeader: UIView {
    
    enum ImageAlignment {
        case left
        case right
    }
    
    @IBOutlet private weak var leftImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var rightImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        leftImageView.isHidden = true
        rightImageView.isHidden = true
    }
    
    func configure(title: String, image: UIImage, position: ImageAlignment) {
        titleLabel.text = "\(title)"
        switch position {
        case .left:
            leftImageView.image = image
            leftImageView.isHidden = false
        case .right:
            rightImageView.image = image
            rightImageView.isHidden = false
        }
    }
}

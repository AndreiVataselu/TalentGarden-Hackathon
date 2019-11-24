//
//  QuizResultVC.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 24/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit

class QuizResultVC: BaseVC {
    
    @IBOutlet private weak var resultImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    @IBOutlet private weak var buttonLabel: UILabel!
    @IBOutlet private weak var buttonContainer: UIView!
    @IBOutlet private weak var coinsImageView: UIImageView!
    var config: QuizResultConfig?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        header?.configure(title: "Quiz", image: UIImage(named: "chess")!, position: .left)
        view.backgroundColor = UIColor(red: 0, green: 135/255, blue: 1, alpha: 1)
        navigationItem.hidesBackButton = true
        
        configureView()
    }
    
    private func configureView() {
        guard let config = config else {
            return
        }
        
        buttonContainer.backgroundColor = config.correctAnswer ? UIColor.seaweed : UIColor.ketchup
        coinsImageView.isHidden = !config.correctAnswer
        titleLabel.text = config.correctAnswer ? "Correct Answer" : "Wrong Answer"
        bodyLabel.text = config.body
        buttonLabel.text = config.correctAnswer ? "CLAIM \(config.reward)" : "OK"
    }
    
    @IBAction private func buttonPressed(_ sender: UIButton) {
        if config?.correctAnswer ?? false {
            myProfile.coins += config?.reward ?? 0
        }
    }
    
}

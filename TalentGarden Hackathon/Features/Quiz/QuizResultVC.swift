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
    var secretConfig: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        header?.configure(title: "Quiz", image: UIImage(named: "chess")!, position: .left)
        view.backgroundColor = UIColor(red: 0, green: 135/255, blue: 1, alpha: 1)
        navigationItem.hidesBackButton = true
        
        if secretConfig {
            secretConfigurationForDemo()
        } else {
            configureView()
        }
    }
    
    private func configureView() {
        guard let config = config else {
            return
        }
        
        buttonContainer.backgroundColor = UIColor.seaweed
        resultImageView.image = config.correctAnswer ? UIImage(named: "correct")! : UIImage(named: "wrong")!
        coinsImageView.isHidden = !config.correctAnswer
        titleLabel.text = config.correctAnswer ? "Correct Answer" : "Wrong Answer"
        bodyLabel.text = config.body
        bodyLabel.isHidden = config.correctAnswer
        buttonLabel.text = config.correctAnswer ? "CLAIM \(config.reward)" : "OK"
    }
    
    func secretConfigurationForDemo() {
        coinsImageView.isHidden = true
        titleLabel.text = "You answered correctly \n\(QuizCoordinator.shared.correctAnswers) / \(QuizCoordinator.shared.questions.count) questions"
        buttonLabel.text = "QUIT"
        bodyLabel.isHidden = true
    }
    
    
    @IBAction private func buttonPressed(_ sender: UIButton) {
        if config?.correctAnswer ?? false {
            myProfile.coins += config?.reward ?? 0
        }
        
        if QuizCoordinator.shared.currentQuestionIndex + 1 < QuizCoordinator.shared.questions.count {
            QuizCoordinator.shared.nextQuestion()
            let currentIndex = QuizCoordinator.shared.currentQuestionIndex
            let question = QuizCoordinator.shared.questions[currentIndex]
            let nextQuestionVC = QuizVC.fromNib()
            let presenter = QuizPresenter(view: nextQuestionVC, question: question)
            nextQuestionVC.presenter = presenter
            navigationController?.pushViewController(nextQuestionVC, animated: true)
            
        } else {
            NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "goToMyProfile")))
            navigationController?.popToRootViewController(animated: false)
        }
       
    }
    
}

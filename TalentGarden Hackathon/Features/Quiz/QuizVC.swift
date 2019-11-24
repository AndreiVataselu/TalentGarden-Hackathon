//
//  QuizVC.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 24/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit

protocol QuizViewProtocol: class {
    func goToResult(correctAnswer: Bool)
}

class QuizVC: BaseVC {
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private var answersLabels: [UILabel]!
    var presenter: QuizPresenterProtocol?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        header?.configure(title: "Quiz", image: UIImage(named: "chess")!, position: .left)
        view.backgroundColor = UIColor(red: 0, green: 135/255, blue: 1, alpha: 1)
        navigationItem.hidesBackButton = true
        
        questionLabel.text = presenter?.question.question
        
        for i in 0..<answersLabels.count {
            answersLabels[i].text = "\(i + 1)) \(presenter?.question.answers[i] ?? "")"
        }
    }
    
    @IBAction private func answerButtonPressed(_ sender: UIButton) {
        presenter?.answerSelected(presenter?.question.answers[sender.tag] ?? "")
    }
}

extension QuizVC: QuizViewProtocol {
    func goToResult(correctAnswer: Bool) {
        let resultVC = QuizResultVC.fromNib()

        if QuizCoordinator.shared.currentQuestionIndex + 1 < QuizCoordinator.shared.questions.count {
            let config = QuizResultConfig(correctAnswer: correctAnswer, body: "\(presenter?.question.details ?? "")", reward: correctAnswer ? (presenter?.question.reward ?? 0): 0)
            resultVC.config = config
        } else {
            resultVC.secretConfig = true
        }
        
        navigationController?.pushViewController(resultVC, animated: true)
    }
}

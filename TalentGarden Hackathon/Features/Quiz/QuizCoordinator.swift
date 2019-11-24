//
//  QuizCoordinator.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 24/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation

class QuizCoordinator {
    var questions: [QuizQuestion]
    var currentQuestionIndex = 0
    var correctAnswers = 0
    static let shared = QuizCoordinator()
    
    init() {
        questions = QuizManager.shared.getQuestions()
    }
    
    func start() -> QuizVC {
        let currentIndex = QuizCoordinator.shared.currentQuestionIndex
        let question = QuizCoordinator.shared.questions[currentIndex]
        let nextQuestionVC = QuizVC.fromNib()
        let presenter = QuizPresenter(view: nextQuestionVC, question: question)
        nextQuestionVC.presenter = presenter
        return nextQuestionVC
    }
    
    func nextQuestion() {
        currentQuestionIndex += 1
    }
}

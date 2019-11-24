//
//  QuizPresenter.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 24/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation

protocol QuizPresenterProtocol: class {
    var question: QuizQuestion { get }
    func answerSelected(_ answer: String)
}

class QuizPresenter: QuizPresenterProtocol {
    weak var view: QuizViewProtocol?
    var question: QuizQuestion
    
    init(view: QuizViewProtocol, question: QuizQuestion) {
        self.view = view
        self.question = question
    }
    
    func answerSelected(_ answer: String) {
        view?.goToResult(correctAnswer: answer == question.correctAnswer)
        
        if question.correctAnswer == answer {
            QuizCoordinator.shared.correctAnswers += 1
        }
    }
}

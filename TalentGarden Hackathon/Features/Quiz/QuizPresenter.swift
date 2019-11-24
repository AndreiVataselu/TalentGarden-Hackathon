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
    
    init(view: QuizViewProtocol) {
        self.view = view
    }
    
    let mockQuestion = QuizQuestion(question: "How much did you spend for online shopping last month?",
                                    answers: ["20 euro", "15 euro", "3 euro"],
                                    correctAnswer: "3 euro",
                                    reward: 15)
    
    var question: QuizQuestion {
        return mockQuestion
    }
    
    
    func answerSelected(_ answer: String) {
        view?.goToResult(correctAnswer: answer == question.correctAnswer)
    }
}

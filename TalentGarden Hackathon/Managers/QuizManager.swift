//
//  QuizManager.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 24/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation

class QuizManager {
    static let shared = QuizManager()
    var formatter = NumberFormatter()
    
    
    private init() {
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
    }
    
    func getQuestions() -> [QuizQuestion] {
        return [getHighestPaidTransaction(), getLeastOftenMerchant(), getLowestPaidTransaction(), getMostOftenMerchant()]
    }
    
    private func getHighestPaidTransaction() -> QuizQuestion {
        let highestAmountPaid = myProfile.transactions.sorted(by: { $0.transactionAmountValue() > $1.transactionAmountValue() }).first(where: { $0.merchant != nil })?.transactionAmountValue() ?? 0
        let answers = ["\(formatter.string(from: NSNumber(value: highestAmountPaid)) ?? "") €",
            "\(formatter.string(from: NSNumber(value: highestAmountPaid * 2)) ?? "") €",
            "\(formatter.string(from: NSNumber(value: highestAmountPaid - 13)) ?? "") €"]
        
        let question = QuizQuestion(question: "What was the highest amount you paid in a transaction ?",
                                    answers: answers.shuffled(),
                                    details: "The highest amount you paid in a transaction was \(formatter.string(from: NSNumber(value: highestAmountPaid)) ?? "") €",
                                    correctAnswer: answers[0],
                                    reward: Int(arc4random_uniform(80)))
        return question
    }
    
    private func getLowestPaidTransaction() -> QuizQuestion {
        let lowestPaid = myProfile.transactions.sorted(by: { $0.transactionAmountValue() < $1.transactionAmountValue() }).first(where: { $0.merchant != nil })?.transactionAmountValue() ?? 0
        let answers = ["\(formatter.string(from: NSNumber(value: lowestPaid)) ?? "") €",
            "\(formatter.string(from: NSNumber(value: lowestPaid * 2)) ?? "") €",
            "\(formatter.string(from: NSNumber(value: lowestPaid + 4)) ?? "") €"]
        
        let question = QuizQuestion(question: "Do you know the minimum amount you paid in a transaction ?",
                                    answers: answers.shuffled(),
                                    details: "The minimum amount you paid in a transaction was \(formatter.string(from: NSNumber(value: lowestPaid)) ?? "") €",
                                    correctAnswer: answers[0],
                                    reward: Int(arc4random_uniform(80)))
        return question
    }
    
    private func getMostOftenMerchant() -> QuizQuestion {
        let set = NSCountedSet(array: myProfile.transactions.compactMap { $0.merchant })
        let oftenMerchant = (set.max { set.count(for: $0) < set.count(for: $1) } as? String) ?? ""
        
        let otherAns = myProfile.transactions.filter { $0.merchant != oftenMerchant }.first?.merchant ?? ""
        let otherAns2 = myProfile.transactions.filter { ($0.merchant != oftenMerchant)  && ($0.merchant != otherAns)}.first?.merchant ?? ""
        let answers = ["\(oftenMerchant)", "\(otherAns)", "\(otherAns2)"]
        
        return QuizQuestion(question: "What is the service you often pay for? ",
                            answers: answers.shuffled(),
                            details: "The service you pay almost every month is \(oftenMerchant)",
                            correctAnswer: oftenMerchant,
                            reward: Int(arc4random_uniform(80)))
    }
    
    private func getLeastOftenMerchant() -> QuizQuestion {
        let set = NSCountedSet(array: myProfile.transactions.compactMap { $0.merchant })
        let oftenMerchant = (set.min { set.count(for: $0) < set.count(for: $1) } as? String) ?? ""
        
        let otherAns = myProfile.transactions.filter { $0.merchant != oftenMerchant }.first?.merchant ?? ""
        let otherAns2 = myProfile.transactions.filter { ($0.merchant != oftenMerchant)  && ($0.merchant != otherAns)}.first?.merchant ?? ""
        let answers = ["\(oftenMerchant)", "\(otherAns)", "\(otherAns2)"]
        
        return QuizQuestion(question: "What company's products you buy very rare?",
                            answers: answers.shuffled(),
                            details: "\(oftenMerchant)'s products are bought very rare by you.",
                            correctAnswer: oftenMerchant,
                            reward: Int(arc4random_uniform(80)))
    }
}

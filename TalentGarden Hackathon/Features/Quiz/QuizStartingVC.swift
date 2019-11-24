//
//  QuizStartingVC.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 24/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit

class QuizStartingVC: BaseVC {
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 135/255, blue: 1, alpha: 1)
        mainLabel.alpha = 0
        button.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6, animations: { [weak self] in
            self?.mainLabel.alpha = 1
            },
                       completion: { [weak self] completed in
                        UIView.animate(withDuration: 0.3, animations: { [weak self] in
                            self?.button.alpha = 1
                        })
                        
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        mainLabel.alpha = 0
        button.alpha = 0
    }
    
    @IBAction private func buttonPressed(_ sender: UIButton) {
        let quizVC = QuizCoordinator.shared.start()
        navigationController?.pushViewController(quizVC, animated: true)
    }
}

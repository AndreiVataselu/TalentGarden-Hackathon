//
//  LoggedInTabBar.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit



enum LoggedInFlows: CaseIterable {
    case myProfile
    case challenges
    case quiz
    
    var viewController: UIViewController {
        switch self {
        case .myProfile:
            return MyProfileVC.fromNib()
        case .challenges:
            return ChallengesVC.fromNib()
        case .quiz:
            return QuizStartingVC.fromNib()
        }
    }
    
    var title: String {
        switch self {
        case .myProfile:
            return "Profile"
        case .challenges:
            return "Challenges"
        case .quiz:
            return "Quiz"
        }
    }
    
    var image: UIImage {
        var imageName = ""
        switch self {
        case .myProfile:
            imageName = "dashboard"
        case .challenges:
            imageName = "rocketship"
        case .quiz:
            imageName = "apps"
        }
        return UIImage(named: imageName)!
    }
    
    func flow() -> UIViewController {
        let navigationController = UINavigationController()
        navigationController.setRootViewController(viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }
}

class LoggedInTabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(goToChallenges(_:)), name: Notification.Name(rawValue: "goToChallenges"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(goToMyProfile(_:)), name: Notification.Name(rawValue: "goToMyProfile"), object: nil)
        
        let viewControllers = LoggedInFlows.allCases.map { $0.flow() }
        setViewControllers(viewControllers, animated: false)
    }
    
    @objc
    private func goToChallenges(_ notification: Notification?) {
        selectedIndex = 1
    }
    
    @objc
    private func goToMyProfile(_ notification: Notification?) {
        selectedIndex = 0
    }
    
}

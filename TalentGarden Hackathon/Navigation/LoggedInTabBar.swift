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
    
    var viewController: UIViewController {
        switch self {
        case .myProfile:
            return MyProfileVC.fromNib()
        case .challenges:
            return ChallengesVC.fromNib()
        }
    }
    
    var title: String {
        switch self {
        case .myProfile:
            return "Profile"
        case .challenges:
            return "Challenges"
        }
    }
    
    func flow() -> UIViewController {
        let navigationController = UINavigationController()
        navigationController.setRootViewController(viewController)
        navigationController.tabBarItem.title = title
        return navigationController
    }
}

class LoggedInTabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewControllers = LoggedInFlows.allCases.map { $0.flow() }
        setViewControllers(viewControllers, animated: false)
    }
    
}

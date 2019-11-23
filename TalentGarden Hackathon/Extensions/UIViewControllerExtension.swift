//
//  UIViewControllerExtension.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    private static func loadNib<T: UIViewController>() -> T? {
        return T(nibName: String(describing: T.self), bundle: nil)
    }
    
    static func fromNib() -> Self {
        return loadNib()!
    }
}


extension UINavigationController {
    func setRootViewController(_ viewController: UIViewController) {
        viewControllers = [viewController]
    }
}

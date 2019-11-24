//
//  UIViewExtensions.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    private static func loadNib<T: UIView>() -> T? {
        return UINib(nibName: String(describing: T.self), bundle: nil).instantiate(withOwner: nil, options: nil).first as? T
    }
    
    static func fromNib() -> Self {
        return loadNib()!
    }
}

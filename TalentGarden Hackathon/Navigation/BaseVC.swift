//
//  BaseVC.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit

class BaseVC: UIViewController {
    var header: NavigationHeader?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = NavigationHeader.fromNib()
        header.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        header.center = navigationController?.navigationBar.center ?? CGPoint(x: 0, y: 0)
        navigationItem.titleView = header
        self.header = header
        view.backgroundColor = UIColor(red: 1, green: 253/255, blue: 251/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = true
    }
}

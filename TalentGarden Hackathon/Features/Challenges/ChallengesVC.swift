//
//  ChallengesVC.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit

class ChallengesVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let header = ChallengeHeader.fromNib()
        header.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        header.center = navigationController?.navigationBar.center ?? CGPoint(x: 0, y: 0)
        navigationItem.titleView = header
    }
}

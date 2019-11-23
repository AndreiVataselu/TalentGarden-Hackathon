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
    let mock = [Challenge(name: "Send money through our app", reward: 10, locked: false),
                Challenge(name: "Uninstall the app", reward: 1000, locked: false)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = ChallengeHeader.fromNib()
        header.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        header.center = navigationController?.navigationBar.center ?? CGPoint(x: 0, y: 0)
        navigationItem.titleView = header
        
        tableView.register(ChallengeTVC.self, forCellReuseIdentifier: String(describing: ChallengeTVC.self))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
}

extension ChallengesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mock.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChallengeTVC.self), for: indexPath) as? ChallengeTVC else {
            return UITableViewCell()
        }
        
        cell.wrappedView?.configure(challenge: mock[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ChallengeTableHeader.fromNib()
        header.configure(levelName: "Level 1", locked: false)
        return header
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        tableView.tableHeaderView = view
    }
}

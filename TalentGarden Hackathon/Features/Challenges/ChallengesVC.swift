//
//  ChallengesVC.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit

class ChallengesVC: BaseVC {
    @IBOutlet private weak var tableView: UITableView!
    let mock = [Challenge(name: "Send money through our app", reward: 10, locked: false),
                Challenge(name: "Uninstall the app", reward: 1000, locked: false)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reconfigureHeader()
        
        tableView.register(ChallengeTVC.self, forCellReuseIdentifier: String(describing: ChallengeTVC.self))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reconfigureHeader()
    }
    
    private func reconfigureHeader() {
        header?.configure(title: "\(myProfile.coins)", image: UIImage(named: "dollar")!, position: .right)
    }
}

extension ChallengesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return AchievementManager.shared.unlockedAchievements.count
        }
        return AchievementManager.shared.lockedAchievements.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChallengeTVC.self), for: indexPath) as? ChallengeTVC else {
            return UITableViewCell()
        }
        
        var data: Challenge = indexPath.section == 0 ? AchievementManager.shared.unlockedAchievements[indexPath.row] :
                                                         AchievementManager.shared.lockedAchievements[indexPath.row]
        
        cell.wrappedView?.configure(challenge: data)
        if indexPath.section == 0 {
            cell.wrappedView?.showClaimButton()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ChallengeTableHeader.fromNib()
        header.configure(levelName: "Level \(section)", locked: section == 1)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

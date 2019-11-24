//
//  AchievementManager.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation

class AchievementManager {
    static let shared = AchievementManager()

  
    var lockedAchievements = [Challenge]()
    var unlockedAchievements = [Challenge]()
    
    private init() {
        unlockedAchievements = [Challenge(name: "Complete your first quiz!", reward: 15, locked: false)]
        lockedAchievements = [Challenge(name: "Open your first deposit account", reward: 30, locked: true)]
    }
    
    
}

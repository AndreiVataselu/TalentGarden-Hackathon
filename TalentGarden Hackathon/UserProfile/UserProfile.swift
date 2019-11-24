//
//  UserProfile.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation

struct UserProfile: Decodable {
    var firstName: String
    var lastName: String
    var coins: Int
    
    var transactions: [Transaction] = []
}

extension UserProfile {
    var fullName: String {
        return firstName + " " + lastName
    }
}

// For mocking purposes
var myProfile = UserProfile(firstName: "Michael", lastName: "Jackson", coins: 0)

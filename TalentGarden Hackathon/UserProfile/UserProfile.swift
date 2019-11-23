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
}

extension UserProfile {
    var fullName: String {
        return firstName + " " + lastName
    }
}

let myProfile = UserProfile(firstName: "Michael", lastName: "Jackson")

//
//  Challenge.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation

struct Challenge: Decodable {
    var name: String
    var reward: Int
    var locked: Bool
}

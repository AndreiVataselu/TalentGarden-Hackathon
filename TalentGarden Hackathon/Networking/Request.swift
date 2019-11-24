//
//  Request.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation

protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var url: URLRequest { get }
    var header: [String: String] { get }
}

extension Request {
    var url: URLRequest {
        let url = URL(string: "http://10.19.2.240:8080" + path)!
        return URLRequest(url: url)
    }

    var header: [String: String] {
        return [:]
    }
}

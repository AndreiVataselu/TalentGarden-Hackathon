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
    var parameters: [String: String] { get }
    var method: HTTPMethod { get }
    var url: URL { get }
}

extension Request {
    var url: URLRequest {
        let url = URL(string: "basePath" + path)!
        return URLRequest(url: url)
    }

    var parameters: [String: String] {
        return [:]
    }
}

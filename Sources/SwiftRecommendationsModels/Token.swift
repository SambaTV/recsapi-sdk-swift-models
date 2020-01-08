//
//  Token.swift
//  SwiftRecommendations Package
//
//  Created by Doron Katz on 11/14/19.
//  Copyright © 2019 Samba TV Inc. All rights reserved.
//

import Foundation

struct Token: Codable {

    let apiToken: String?

    enum CodingKeys: String, CodingKey {
        case apiToken = "api_token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        apiToken = try values.decode(String.self, forKey: .apiToken)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(apiToken, forKey: .apiToken)
    }
}

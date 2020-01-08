//
//  Review.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 16/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation

public struct Review: Codable, Identifiable {
    public let id: String
    public let author: String
    public let content: String
}

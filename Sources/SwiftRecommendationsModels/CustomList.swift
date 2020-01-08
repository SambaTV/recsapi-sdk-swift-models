//
//  CustomList.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 18/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation

public struct CustomList: Codable, Identifiable {
    public let id: Int
    public var name: String
    public var cover: Int?
    public var movies: Set<Int>
}

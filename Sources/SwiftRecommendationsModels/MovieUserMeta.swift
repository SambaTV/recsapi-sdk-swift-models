//
//  MovieUserMeta.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 28/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation

public struct MovieUserMeta: Codable {
    init(addedToList: Date) {
        self.addedToList = addedToList
    }
    public var addedToList: Date?
}

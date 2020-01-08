//
//  MovieImage.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 21/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation

public struct ImageData: Codable, Identifiable {
    public let id = UUID()
    public let aspect_ratio: Float
    public let file_path: String
    public let height: Int
    public let width: Int
}

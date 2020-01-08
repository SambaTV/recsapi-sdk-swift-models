//
//  Cast.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 09/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation

public struct People: Codable, Identifiable {
    public let id: Int
    public let name: String
    public var character: String?
    public var department: String?
    public let profile_path: String?
        
    public let known_for_department: String?
    public var known_for: [KnownFor]?
    public let also_known_as: [String]?
    
    public let birthDay: String?
    public let deathDay: String?
    public let place_of_birth: String?
    
    public let biography: String?
    public let popularity: Double?
    
    public var images: [ImageData]?
    
    public struct KnownFor: Codable, Identifiable {
        public let id: Int
        public let original_title: String?
        public let poster_path: String?
    }
}

extension People {
    public var knownForText: String? {
        guard let knownFor = known_for else {
            return nil
        }
        let names = knownFor.filter{ $0.original_title != nil}.map{ $0.original_title! }
        return names.joined(separator: ", ")
    }
}

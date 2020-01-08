//
//  ContentItem.swift
//  recsapi-sdk-swift
//  Copyright (c) 2019. Samba TV
//  Created by Doron Katz on 11/14/19.
//

import Foundation

public struct ContentItem: Codable, Equatable {
    
    enum CodingKeys: String, CodingKey {
        case contentID = "content_id"
        case seriesID = "series_id"
        case rank = "rank"
        case score = "score"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rank = try values.decode(Int.self, forKey: .rank)
        score = try values.decode(Float.self, forKey: .score)
        do {
            seriesID = try values.decode(String.self, forKey: .seriesID)
        }catch{
            seriesID = ""
        }
        do{
            contentID = try values.decode(String.self, forKey: .contentID)
        }
        catch{
            contentID = ""
        }
        
        
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(score, forKey: .score)
        try container.encode(rank, forKey: .rank)
        try container.encode(seriesID, forKey: .seriesID)
        try container.encode(contentID, forKey: .contentID)
    }

    public let rank: Int
    public let score: Float
    public var seriesID: String
    public var contentID: String

}


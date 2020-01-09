//
//  PaginatedResponse.swift
//
//  Created by Doron Katz on 11/14/19.
//

import Foundation

public struct PaginatedResponse<T: Codable>: Codable {
    let paginator: Paginator
    let results: [T]
}

public struct MoviePaginatedResponse<T: Codable>: Codable {
    let results: [T]
    
    public enum CodingKeys: String, CodingKey {
        case results = "movie_results"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decode([T].self, forKey: .results)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(results, forKey: .results)
    }
    
}

public struct Paginator: Codable {
    let page: Int
    let size: Int
    var perPage: Int? {
        guard next == nil else {
            if let perPage = next?.split(separator: "=", maxSplits: 2, omittingEmptySubsequences: true).last {
                return  Int(perPage)
            }
            return nil
        }
        return nil
    }
    let prev: String?
    let next: String?

}

public let samplePaginator = Paginator(page: 1, size: 300, prev: nil, next: "page=2&per_page=25")

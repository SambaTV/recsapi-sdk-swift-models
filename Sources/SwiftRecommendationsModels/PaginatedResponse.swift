//
//  PaginatedResponse.swift
//
//  Created by Doron Katz on 11/14/19.
//

import Foundation

public struct PaginatedResponse<T: Codable>: Codable {
    public let paginator: Paginator
    public let results: [T]
}

public struct MoviePaginatedResponse<T: Codable>: Codable {
    public let page: Int?
    public let total_results: Int?
    public let total_pages: Int?
    public let movie_results: [T]
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

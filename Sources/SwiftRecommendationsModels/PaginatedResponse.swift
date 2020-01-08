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

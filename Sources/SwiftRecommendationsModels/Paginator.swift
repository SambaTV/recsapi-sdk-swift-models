//
//  Paginator.swift
//  recsapi-sdk-swift  
//  Copyright (c) 2019. Samba TV
//  Created by Doron Katz on 11/15/19.
//

import Foundation

public struct Paginator: Codable {
    public let page: Int
    public let size: Int
    public var perPage: Int? {
        guard next == nil else {
            if let perPage = next?.split(separator: "=", maxSplits: 2, omittingEmptySubsequences: true).last {
                return  Int(perPage)
            }
            return nil
        }
        return nil
    }
    public let prev: String?
    public let next: String?

}

public let samplePaginator = Paginator(page: 1, size: 300, prev: nil, next: "page=2&per_page=25")

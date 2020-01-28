//
//  DiscoverFilter.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 23/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation

public struct DiscoverFilter: Codable {
    public let year: Int
    public let startYear: Int? = nil
    public let endYear: Int? = nil
    public let sort: String
    public let genre: Int? = nil
    public let region: String
    
    public init(year: Int, startYear: Int?, endYear: Int?, sort: String, genre: Int?, region: String) {
        self.year = year
        self.sort = sort
        self.region = region
    }
    
    public static func randomFilter(region: String) -> DiscoverFilter {
        return DiscoverFilter(year: Calendar.current.component(.year, from: Date()),
                              startYear: nil,
                              endYear: nil,
                              sort: randomSort(),
                              genre: nil,
                              region: region)
    }
    
    public static func randomYear() -> Int {
        let calendar = Calendar.current
        return Int.random(in: 2000..<calendar.component(.year, from: Date()))
    }
    
    public static func randomSort() -> String {
        let sortBy = ["popularity.desc",
                      "popularity.asc",
                      "vote_average.asc",
                      "vote_average.desc"]
        return sortBy[Int.random(in: 0..<sortBy.count)]
    }
    
    public static func randomPage() -> Int {
        return Int.random(in: 1..<20)
    }
    
    public func toParams() -> [String: String] {
        var params: [String: String] = [:]
        if let startYear = startYear, let endYear = endYear {
            params["primary_release_date.gte"] = "\(startYear)"
            params["primary_release_date.lte"] = "\(endYear)"
        } else {
            params["year"] = "\(year)"
        }
        if let genre = genre {
            params["with_genres"] = "\(genre)"
        }
        
        params["region"] = region
        params["page"] = "\(DiscoverFilter.randomPage())"
        params["sort_by"] = sort
        params["language"] = "en-US"
        return params
    }
    
    public func toText(genres: [Genre]) -> String {
        var text = String("")
        if let startYear = startYear, let endYear = endYear {
            text = text + "\(startYear)-\(endYear)"
        } else {
            text = text + " · Random"
        }
        if let genre = genre,
            let stateGenre = genres.first(where: { (realGenre) -> Bool in
                realGenre.id == genre
            }) {
            text = text + " · \(stateGenre.name)"
        }
        text = text + " · \(region)"
        
        return text
    }
}

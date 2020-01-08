//
//  Movie.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 06/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation

public struct Movie: Codable, Identifiable {
    public let id: Int
    
    public let original_title: String
    public let title: String
    public var userTitle: String {
        return original_title
    }
    
    public let overview: String
    public let poster_path: String?
    public let backdrop_path: String?
    public let popularity: Float
    public let vote_average: Float
    public let vote_count: Int
    
    public let release_date: String?
    public var releaseDate: Date? {
        return release_date != nil ? Movie.dateFormatter.date(from: release_date!) : Date()
    }
    
    public static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd"
        return formatter
    }()
    
    public let genres: [Genre]?
    public let runtime: Int?
    public let status: String?
    
    public var keywords: Keywords?
    public var images: MovieImages?
    
    public var production_countries: [productionCountry]?
    
    public var character: String?
    public var department: String?
    
    public struct Keywords: Codable {
        public let keywords: [Keyword]?
    }
    
    public struct MovieImages: Codable {
        public let posters: [ImageData]?
        public let backdrops: [ImageData]?
    }
    
    public struct productionCountry: Codable, Identifiable {
        public let id = UUID()
        public let name: String
    }
}

public let sampleMovie = Movie(id: 0,
                        original_title: "Test movie Test movie Test movie Test movie Test movie Test movie Test movie ",
                        title: "Test movie Test movie Test movie Test movie Test movie Test movie Test movie  Test movie Test movie Test movie",
                        overview: "Test desc",
                        poster_path: "/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg",
                        backdrop_path: "/nl79FQ8xWZkhL3rDr1v2RFFR6J0.jpg",
                        popularity: 50.5,
                        vote_average: 8.9,
                        vote_count: 1000,
                        release_date: "1972-03-14",
                        genres: [Genre(id: 0, name: "test")],
                        runtime: 80,
                        status: "released")

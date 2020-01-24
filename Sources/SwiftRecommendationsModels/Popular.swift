//
//  Popular.swift
//  recsapi-sdk-swift  
//  Copyright (c) 2019. Samba TV
//  Created by Doron Katz on 11/15/19.
//

import Foundation

public struct Popular {
    public enum ContentType: String, CaseIterable {
        case movies = "movies"
        case series = "episodes"
    }

    public enum Namespace: String, CaseIterable {
           case imdb
           case samba
           case gracenote
           case fyi
    }
    
    public init(country: String?, genres: [SambaGenre]?) {
        self.isoCountry = country
        self.genres = genres
    }

    /// Of type isoCountryCode
    public let isoCountry: String?
    public let genres: [SambaGenre]?
    //let namespace: Namespace?
}

public let sampleParameter = Popular(country: "US", genres: nil)

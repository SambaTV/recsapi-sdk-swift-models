//
//  Popular.swift
//  recsapi-sdk-swift  
//  Copyright (c) 2019. Samba TV
//  Created by Doron Katz on 11/15/19.
//

import Foundation

public struct Popular {
    public enum CountryCode: String, CaseIterable {
        case gbr = "GBR"
        case usa = "USA"
        case aus = "AUS"
        case deu = "DEU"
        case ita = "ITA"
        case fra = "FRA"
    }

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
    
    public init(country: CountryCode?, genres: [SambaGenre]?) {
        self.country = country
        self.genres = genres
    }

    public let country: CountryCode?
    public let genres: [SambaGenre]?
    //let namespace: Namespace?
}

public let sampleParameter = Popular(country: .gbr, genres: nil)

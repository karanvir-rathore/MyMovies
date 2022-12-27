//
//  MovieDetails.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 20/12/22.
//

import Foundation

struct MovieDetails: Decodable {
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let imdbId: String
    let productionCompanies: [ProductionCompanies]
    let productionCountries: [ProductionCountries]
    let revenue: Int
    let runtime: Int
    let status: String
    let tagline: String
    
    enum CodingKeys: String, CodingKey {
        case budget
        case genres
        case homepage
        case imdbId = "imdb_id"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case revenue
        case runtime
        case status
        case tagline
    }
}

struct Genre: Codable {
    let id: Int
    let name: String
}

struct ProductionCompanies: Codable {
    let id: Int
    let logoPath: String?
    let name, originCountry: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

struct ProductionCountries: Codable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

struct SpokenLanguage: Codable {
    let englishName: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case name
    }
}

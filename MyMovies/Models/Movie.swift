//
//  Movie.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 20/12/22.
//

import Foundation

struct Movie: Decodable, Identifiable , Hashable {
    let id = UUID()
    let movieId: Int?
    let adult: Bool?
    let backdropPath: String?
    let genreIds: [Int]?
    let originalTitle: String?
    let overview: String?
    let populatrity: Double?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalTitle = "original_title"
        case overview
        case populatrity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension Movie: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Movie {
    // MARK: - Calculated properties
    
    var releaseInfo: String {
        guard let releaseDate = releaseDate else { return "N/A" }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        
        guard let date = dateFormatter.date(from: releaseDate) else {
            return "N/A"
        }
        
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "en")
        
        return dateFormatter.string(from: date)
    }
    
    var userScore: String {
        guard let voteAverage = voteAverage else { return "N/A" }
        return String(format: "%.0f", voteAverage * 10) + "%"
    }
    
    var posterUrl: URL? {
        URL(string: Environment.posterImageBaseUrl + (posterPath ?? ""))
    }
    
    var backdropUrl: URL? {
        URL(string: Environment.backdropImageBaseUrl + (backdropPath ?? ""))
    }
}

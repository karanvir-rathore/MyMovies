//
//  MovieList.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 20/12/22.
//

import Foundation

struct MovieList: Decodable {
    
    let page: Int
    let movies: [Movie]
    let totalPages: Int
    let totalResult: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalPages = "total_pages"
        case totalResult = "total_results"
    }
}

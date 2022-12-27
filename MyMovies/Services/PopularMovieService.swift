//
//  PopularMovieService.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 21/12/22.
//

import Foundation

struct PopularMovieService {
    
    static func getPopularMovies(page: String) async throws -> MovieList {
        let request = PopularMoviesRequest.getPopularMovies(page)
        let result = try await NetworkService.run(request, responseModel: MovieList.self)
        return result
    }
}

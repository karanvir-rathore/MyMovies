//
//  MovieDetailService.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 21/12/22.
//

import Foundation

struct MovieDetailsService {
    static func getMovieDetails(movieId: Int) async throws -> MovieDetails {
        let request = MovieDetailRequest.getMovieDetails(movieId)
        let result = try await NetworkService.run(request, responseModel: MovieDetails.self)
        return result
    }
}

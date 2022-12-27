//
//  MovieDetailsViewModel.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 23/12/22.
//

import Foundation

@MainActor
class MovieDetailsViewModel: ObservableObject {
    
    // MARK: - Property Wrappers
    @Published var movieDetailsState: RequestState<MovieInfo> = .undefined
    
    // MARK: - Public
    let movie: Movie
    
    // MARK: - Init
    ///  Initializer
    /// - Parameter movie: Movie
    init(movie: Movie) {
        self.movie = movie
    }
    
    // MARK: - Methods
    
    ///  Fetches Movie Details
    func fetchMovieDetails() async {
        guard let movieId = movie.movieId else { return }
        
        do {
            movieDetailsState = .loading
            let movieDetails = try await MovieDetailsService.getMovieDetails(movieId: movieId)
            movieDetailsState = .success(MovieInfo(movie: movie, details: movieDetails))
        } catch {
            movieDetailsState = .failure(error)
        }
    }
}

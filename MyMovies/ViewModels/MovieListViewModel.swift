//
//  MovieListViewModel.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 21/12/22.
//

import Foundation

@MainActor
class MovieListViewModel: ObservableObject {
    
    // MARK: - Property Wrappers
    @Published var movieListState: RequestState<[Movie]> = .undefined
    
    // MARK: - Private
    private var movies: [Movie] = []
    private var page: Int = 1
    private var totalPages: Int = 0
    
    // MARK: - Methods
    
    ///  Fetch Populer Movies
    /// - Parameter isInitialLoad: Bool flag used to distinguish between initial and subsequent loads
    func fetchPopularMovies(isInitialLoad: Bool) async {
        do {
            if isInitialLoad {
                movieListState = .loading
            }
            
            let movieList = try await PopularMovieService.getPopularMovies(page: String(page))
            totalPages = movieList.totalPages
            movies.append(contentsOf: movieList.movies)
            movieListState = .success(movies)
        } catch {
            movieListState = .failure(error)
        }
    }
    
    /// Fetches next set of data based on the page index
    func loadMoreContent() async {
        if (page + 1) <= totalPages {
            page += 1
            await fetchPopularMovies(isInitialLoad: false)
        }
    }
}

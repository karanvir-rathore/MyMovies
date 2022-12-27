//
//  PopularMoviesView.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 22/12/22.
//

import SwiftUI

struct PopularMoviesScreen: View {
    
    @StateObject var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 10) {
                    switch viewModel.movieListState {
                    case .loading:
                        LoaderView()
                    case .success(let movies):
                        ForEach(movies, id: \.id) { movie in
                            NavigationLink {
                                MovieDetailsScreen(viewModel: MovieDetailsViewModel(movie: movie))
                            } label: {
                                MovieTileView(url: movie.posterUrl)
                                    .frame(width: UIScreen.main.bounds.width - 48, height: 500)
                                    .onAppear {
                                        if movie == movies.last {
                                            Task {
                                                await viewModel.loadMoreContent()
                                            }
                                        }
                                    }
                            }
                        }
                    default:
                        EmptyView()
                    }
                }
            }
            .navigationTitle("Popular Movies")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                Task {
                    if viewModel.movieListState.value == nil {
                        await viewModel.fetchPopularMovies(isInitialLoad: true)
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.myMovie.navTitle)
    }
}

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesScreen()
    }
}

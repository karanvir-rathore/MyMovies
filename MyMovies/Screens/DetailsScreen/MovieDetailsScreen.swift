//
//  MovieDetailsScreen.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 23/12/22.
//

import SwiftUI

struct MovieDetailsScreen: View {
    
    @ObservedObject var viewModel: MovieDetailsViewModel
    
    var body: some View {
        ScrollView {
            switch viewModel.movieDetailsState {
            case .loading:
                LoaderView()
            case .success(let info):
                VStack(alignment: .leading, spacing: 24) {
                    Text(info.movie.title ?? "N/A")
                        .font(.title)
                        .bold()
                    
                    MovieTileView(url: info.movie.backdropUrl)
                        .frame(height: 200)
                    
                    GenresAndTimeView(genres: info.details.genresInfo,
                                      runtime: info.details.runtimeInfo)
                    
                    VoteAndReleaseView(voteAverage: info.movie.voteAverage,
                                       userScore: info.movie.userScore,
                                       voteCount: info.movie.voteCount,
                                       release: info.movie.releaseInfo)
                    
                    taglineView(tagline: info.details.tagline)
                    
                    overviewView(info: info)
                    
                    GenericInfoView(title: "Revenue",
                                    info: info.details.revenueInfo)
                    
                    GenericInfoView(title: "Production Companies",
                                    info: info.details.productionCompaniesInfo)
                    
                    GenericInfoView(title: "Production Countries",
                                    info: info.details.productionCountriesInfo)
                }
                .padding(.horizontal, 24)
                .frame(maxHeight: .infinity)
            default:
                EmptyView()
            }
        }
        .task {
            await viewModel.fetchMovieDetails()
        }
    }
}

extension MovieDetailsScreen {
    
    @ViewBuilder
    func taglineView(tagline: String) -> some View {
        if !tagline.isEmpty {
            Text(tagline)
                .font(.body)
                .italic()
        }
    }
    
    @ViewBuilder
    func overviewView(info: MovieInfo) -> some View {
        if let overview = info.movie.overview {
            Text("Overview")
                .font(.body)
                .bold()
            Text(overview)
                .font(.subheadline)
        }
    }
}

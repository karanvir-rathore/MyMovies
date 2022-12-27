//
//  MovieDetailRequest.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 21/12/22.
//

import Foundation

enum MovieDetailRequest: RequestProtocol {
    
case getMovieDetails(_ movieId: Int)
    
    var path: String {
        switch self {
        case .getMovieDetails(let movieId):
            return "/\(movieId)"
        }
    }
    
    var requestType: RequestType {
        .get
    }
}

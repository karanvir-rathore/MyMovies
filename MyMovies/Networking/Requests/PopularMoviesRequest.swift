//
//  PopularMoviesRequest.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 21/12/22.
//

import Foundation

enum PopularMoviesRequest: RequestProtocol {
    
    case getPopularMovies(_ page: String)
    
    var path: String {
        "popular"
    }
    
    var urlParams: [String: String?] {
        switch self {
        case .getPopularMovies(let page):
            return ["page": page]
        }
    }
    
    var requestType: RequestType {
        .get
    }
}

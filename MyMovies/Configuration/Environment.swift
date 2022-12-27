//
//  Environment.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 21/12/22.
//

import Foundation

enum Environment: String {
    
    // MARK: - Environment
    
    case debug
    case release
    
    // MARK: - Current Environment
    
    static let current: Environment = {
        guard let rawValue = Bundle.main.infoDictionary?["Configuration"] as? String else {
            fatalError("No Environment Found")
        }
        
        guard let environment = Environment(rawValue: rawValue.lowercased()) else {
            fatalError("Invalid Environment")
        }
        
        return environment
    }()
    
    // MARK: - Base URL
    
    static var baseURL: String {
        switch current {
        case .debug, .release:
            return "api.themoviedb.org"
        }
    }
    
    // MARK: - API key
    
    static var apiKey: String {
        switch current {
        case .debug, .release:
            return "0de24ce763fb9da5d804f4fc00163a55"
        }
    }
    
    // MARK: - Poster Image URL
    
    static var posterImageBaseUrl: String {
        switch current {
        case .debug, .release:
            return "https://image.tmdb.org/t/p/w500"
        }
    }
    
    // MARK: - Backdrop Image URL
    
    static var backdropImageBaseUrl: String {
        switch current {
        case .debug, .release:
            return "https://image.tmdb.org/t/p/w780"
        }
    }
}

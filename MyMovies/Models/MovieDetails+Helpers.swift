//
//  MovieDetails+Helpers.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 23/12/22.
//

import Foundation

extension MovieDetails {
    
    // MARK: - Calculated properties
    
    var genresInfo: String {
        return genres.map{ $0.name }.joined(separator: ", ")
    }
    
    var revenueInfo: String {
        let formatter = NumberFormatter()
        formatter.groupingSize = 3
        formatter.usesGroupingSeparator = true
        return "$" + (formatter.string(from: revenue as NSNumber) ?? "")
    }
    
    var productionCompaniesInfo: String {
        return productionCompanies.map{ $0.name }.joined(separator: ", ")
    }
    
    var productionCountriesInfo: String {
        return productionCountries.map{ $0.name }.joined(separator: ", ")
    }
    
    var runtimeInfo: String {
        guard runtime > 0 else {
            return "N/A"
        }
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        return formatter.string(from: TimeInterval(runtime) * 60) ?? "N/A"
    }

}

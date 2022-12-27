//
//  NetworkError.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 21/12/22.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case parse
    case noResponse
    case unauthorized
    case unexpectedStatusCode
}

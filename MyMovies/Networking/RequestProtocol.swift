//
//  RequestProtocol.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 21/12/22.
//

import Foundation

protocol RequestProtocol {
    var path: String { get }
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    var urlParams: [String: String?] { get }
    var addAuthorizationToken: Bool { get }
    var requestType: RequestType { get }
}

extension RequestProtocol {
    var host: String {
        Environment.baseURL
    }
    
    var basePath: String {
        "/3/movie/"
    }
    
    var addAuthorizationToken: Bool {
        false
    }
    
    var params: [String: Any] {
        [:]
    }
    
    var urlParams: [String: String?] {
        [:]
    }
    
    var baseUrlParams: [String: String?] {
        ["api_key": Environment.apiKey,
         "language": "en-US"]
    }
    
    var headers: [String: String] {
        [:]
    }
    
    func createURLRequest(authToken: String?) throws -> URLRequest {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = basePath + path
        
        components.queryItems = baseUrlParams.map {
            URLQueryItem(name: $0, value: $1)
        }
        
        if !urlParams.isEmpty {
            urlParams.forEach {
                let queryItem = URLQueryItem(name: $0, value: $1)
                components.queryItems?.append(queryItem)
            }
        }
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        if addAuthorizationToken {
            urlRequest.setValue(authToken,
                                forHTTPHeaderField: "Authorization")
        }
        
        urlRequest.setValue("application/json",
                            forHTTPHeaderField: "Content-Type")
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(
                withJSONObject: params)
        }
        
        return urlRequest
    }
}

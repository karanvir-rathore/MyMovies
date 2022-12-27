//
//  NetwokService.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 21/12/22.
//

import Foundation

protocol NetwokServiceProtocol {
    static func run<T: Decodable>(_ request: RequestProtocol, authToken: String?, responseModel: T.Type) async throws -> T
}

struct NetworkService: NetwokServiceProtocol {
    static func run<T: Decodable>(_ request: RequestProtocol, authToken: String? = nil, responseModel: T.Type) async throws -> T {
        do {
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration)
            
            let (data, response) = try await session.data(for: request.createURLRequest(authToken: authToken))
            
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.noResponse }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                    throw NetworkError.parse
                }
                return decodedResponse
            case 401:
                throw NetworkError.unauthorized
            default:
                throw NetworkError.unexpectedStatusCode
            }
        } catch {
            throw error
        }
    }
}

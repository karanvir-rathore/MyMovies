//
//  RequestState.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 21/12/22.
//

import Foundation
import Combine

///  Enum defined to handle async api call states
public enum RequestState<T> {
    case undefined
    case loading(_ data: T?)
    case success(_ data: T)
    case failure(_ error: Error)
    
    public static var loading: RequestState<T> {
        .loading(nil)
    }
}

public extension RequestState {
    init(_ value: T?) {
        if let value = value {
            self = .success(value)
        } else {
            self = .undefined
        }
    }
}

public extension RequestState {
    var isLoading: Bool {
        switch self {
        case .loading:
            return true
        default:
            return false
        }
    }
    
    var isSuccess: Bool {
        switch self {
        case .success(_):
            return true
        default:
            return false
        }
    }
    
    var isFailure: Bool {
        switch self {
        case .failure(_):
            return true
        default:
            return false
        }
    }
    
    var value: T? {
        switch self {
        case .success(let value):
            return value
        case .loading(let value):
            return value
        default:
            return nil
        }
    }
    
    var error: Error? {
        switch self {
        case .failure(let error):
            return error
        default:
            return nil
        }
    }
}

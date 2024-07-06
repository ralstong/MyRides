//
//  APIError.swift
//  MyRides
//
//  Created by Ralston Goes on 6/28/24.
//

/// Custom enum to handle API errors
enum APIError: Error, CustomStringConvertible {
    case decodingError
    case badUrl
    case requestFailed
    case emptyData
    case unknownError
    
    var description: String {
        switch self {
        case .decodingError:
            "Decoding response failed"
        case .badUrl:
            "Invalid URL"
        case .requestFailed:
            "Request failed"
        case .emptyData:
            "Data is empty"
        case .unknownError:
            "Unknown error"
        }
    }
}

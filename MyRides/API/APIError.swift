//
//  APIError.swift
//  MyRides
//
//  Created by Ralston Goes on 6/28/24.
//

/// Custom enum to handle API errors
enum APIError: Error {
    case decodingError
    case badUrl
    case requestFailed
    case emptyData
    case unknownError
}

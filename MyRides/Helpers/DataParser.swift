//
//  DataParser.swift
//  MyRides
//
//  Created by Ralston Goes on 6/28/24.
//

import Foundation

/// Generic data parser for decodable types
struct DataParser {
    static func parse<T: Decodable>(_ data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        guard let data = try? decoder.decode(T.self, from: data) else {
            throw APIError.decodingError
        }
        return data
    }
}

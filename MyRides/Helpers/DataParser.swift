//
//  DataParser.swift
//  MyRides
//
//  Created by Ralston Goes on 6/28/24.
//

import Foundation

struct DataParser {
    static func parse<T: Decodable>(_ data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = try? decoder.decode(T.self, from: data) else {
            throw APIError.decodingError
        }
        return data
    }
}

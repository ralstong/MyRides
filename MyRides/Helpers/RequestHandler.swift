//
//  RequestHandler.swift
//  MyRides
//
//  Created by Ralston Goes on 6/28/24.
//

import Foundation

struct RequestHandler {
    static func fetchData(from url: String) async throws -> Data {
        guard let url = URL(string: url) else {
            throw APIError.badUrl
        }
        guard let (data, _) = try? await URLSession.shared.data(from: url) else {
            throw APIError.requestFailed
        }
        guard !data.isEmpty else {
            throw APIError.emptyData
        }
        return data
    }
}

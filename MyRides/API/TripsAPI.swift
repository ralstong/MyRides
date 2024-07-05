//
//  TripsAPI.swift
//  MyRides
//
//  Created by Ralston Goes on 6/28/24.
//

import Foundation

/// Implements API call to fetch trips
struct TripsAPI: TripsService {
    
    private let baseUrl = "https://hopskipdrive-static-files.s3.us-east-2.amazonaws.com/interview-resources"
    private let tripEndpoint = "/Trip.json"
    
    func fetchRides() async throws -> TripInfo {
        let ridesUrl = baseUrl + tripEndpoint
        let data = try await RequestHandler.fetchData(from: ridesUrl)
        let rides: TripInfo = try DataParser.parse(data)
        return rides
    }
}

//
//  MockTripsAPI.swift
//  MyRidesTests
//
//  Created by Ralston Goes on 7/5/24.
//

import Foundation
@testable import MyRides

class MockTripsAPI: TripsService {
    var forceFailure = false
    
    func fetchRides() async throws -> MyRides.TripInfo {
        guard !forceFailure else {
            throw APIError.requestFailed
        }
        return TripInfo(trips: MockTripsData.singleTrip)
    }
}

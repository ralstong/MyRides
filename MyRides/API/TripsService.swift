//
//  TripsService.swift
//  MyRides
//
//  Created by Ralston Goes on 6/28/24.
//

import Foundation

/// Protocol that defines a service to fetch trips
protocol TripsService {
    func fetchRides() async throws -> TripInfo
}

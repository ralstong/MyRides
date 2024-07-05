//
//  TripInfo.swift
//  MyRides
//
//  Created by Ralston Goes on 6/28/24.
//
import Foundation

struct TripInfo: Decodable {
    let trips: [Trip]
}

struct Trip: Decodable {
    let estimatedEarnings: Double
    let passengers: [Passenger]
    let plannedRoute: Route
    let waypoints: [Waypoint]
}

struct Passenger: Decodable {
    let boosterSeat: Bool
}

struct Route: Decodable {
    let startsAt: Date
    let endsAt: Date
}

struct Waypoint: Decodable {
    let id: Int
    let location: Location
}

struct Location: Decodable {
    let address: String
}

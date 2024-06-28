//
//  Rides.swift
//  MyRides
//
//  Created by Ralston Goes on 6/28/24.
//
import Foundation

struct Rides: Decodable {
    let trips: [Trip]
}

struct Trip: Decodable {
    let estimatedEarnings: Int
    let slug: String
    let passengers: [Passenger]
    let plannedRoute: Route
    let waypoints: [Waypoint]
}

struct Passenger: Decodable {
    let uuid: UUID
    let boosterSeat: Bool
}

struct Route: Decodable {
    let startsAt: Date
    let endsAt: Date
    let legs: [RouteLeg]
}

struct RouteLeg: Decodable {
    let position: Int
    let startWaypointId: Int
    let endWaypointId: Int
}

struct Waypoint: Decodable {
    let id: Int
    let location: Location
}

struct Location: Decodable {
    let address: String
}

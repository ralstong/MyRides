//
//  MockData.swift
//  MyRidesTests
//
//  Created by Ralston Goes on 7/6/24.
//

import Foundation
@testable import MyRides

enum MockTripsData {
    static var singleTrip = [
    Trip(estimatedEarnings: 23022,
         passengers: [Passenger(boosterSeat: true), Passenger(boosterSeat: false)],
         plannedRoute: Route(startsAt: "2024-07-01T18:15:00Z".iso8601Date(), endsAt: "2024-07-02T18:15:00Z".iso8601Date()),
         waypoints: [Waypoint(id: 1, location: Location(address: "12 Some Road, USA"))]
        )
    ]
    
    static var multipleTrips = [
        Trip(estimatedEarnings: 23022,
             passengers: [Passenger(boosterSeat: true), Passenger(boosterSeat: false)],
             plannedRoute: Route(startsAt: "2024-07-01T18:15:00Z".iso8601Date(), endsAt: "2024-07-01T19:15:00Z".iso8601Date()),
             waypoints: [Waypoint(id: 1, location: Location(address: "12 Some Road, USA"))]
            ),
        Trip(estimatedEarnings: 2413,
             passengers: [Passenger(boosterSeat: false), Passenger(boosterSeat: false)],
             plannedRoute: Route(startsAt: "2024-07-03T09:15:00Z".iso8601Date(), endsAt: "2024-07-03T11:00:00Z".iso8601Date()),
             waypoints: [Waypoint(id: 2, location: Location(address: "12 Some Ave, USA"))]
            ),
        Trip(estimatedEarnings: 3454,
             passengers: [Passenger(boosterSeat: false), Passenger(boosterSeat: true)],
             plannedRoute: Route(startsAt: "2024-05-22T23:59:59Z".iso8601Date(), endsAt: "2024-05-23T00:13:45Z".iso8601Date()),
             waypoints: [Waypoint(id: 3, location: Location(address: "12 Some Way, USA"))]
            ),
        Trip(estimatedEarnings: 9989,
             passengers: [Passenger(boosterSeat: true), Passenger(boosterSeat: true)],
             plannedRoute: Route(startsAt: "2024-05-22T00:00:00Z".iso8601Date(), endsAt: "2024-05-22T04:15:00Z".iso8601Date()),
             waypoints: [Waypoint(id: 4, location: Location(address: "12 Some Lane, USA"))]
            ),
        Trip(estimatedEarnings: 278433,
             passengers: [Passenger(boosterSeat: false)],
             plannedRoute: Route(startsAt: "2024-07-03T19:00:00Z".iso8601Date(), endsAt: "2024-07-04T00:00:00Z".iso8601Date()),
             waypoints: [Waypoint(id: 5, location: Location(address: "12 Some Pole, USA"))]
            )
    ]
}

fileprivate extension String {
    func iso8601Date() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: self) ?? Date()
    }
}

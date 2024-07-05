//
//  MyRidesHelper.swift
//  MyRides
//
//  Created by Ralston Goes on 6/28/24.
//

import Foundation

/// Helper struct to facilitate working with the Trip data
struct MyRidesHelper {
    
    /// Returns the sorted array of unique trip start Date values extracted from an array of Trips
    static func fetchTripDates(_ trips: [Trip]) -> [Date] {
        var dateSet = Set<Date>()
        trips.forEach {
            dateSet.insert(Calendar.current.startOfDay(for: $0.plannedRoute.startsAt))
        }
        return Array(dateSet).sorted(by: <)
    }
    
    /// Returns the sorted array of Trips for a given Date extracted from an array of Trips
    static func fetchSortedTripsFor(dateKey: Date, _ trips: [Trip]) -> [Trip] {
        trips.filter { Calendar.current.startOfDay(for: $0.plannedRoute.startsAt) == dateKey }
            .sorted(by: { $0.plannedRoute.endsAt < $1.plannedRoute.endsAt } )
    }
}

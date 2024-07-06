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
    /// - Parameters:
    ///   - trips: array of Trip values
    ///   - calendar: optional Calendar instance, uses Calendar.current by default
    /// - Returns: a sorted array of unique start of day dates
    static func fetchTripDates(_ trips: [Trip],
                               _ calendar: Calendar = Calendar.current) -> [Date] {
        var dateSet = Set<Date>()
        trips.forEach {
            dateSet.insert(calendar.startOfDay(for: $0.plannedRoute.startsAt))
        }
        return Array(dateSet).sorted(by: <)
    }
    
    /// Returns the sorted array of Trips for a given Date extracted from an array of Trips
    /// - Parameters:
    ///   - dateKey: the unique start of day Date identifier
    ///   - trips: array of Trip objects
    ///   - calendar: optional Calendar instance, uses Calendar.current by default
    /// - Returns: a sorted array of Trip values with the same date key
    static func fetchSortedTripsFor(dateKey: Date,
                                    _ trips: [Trip],
                                    _ calendar: Calendar = Calendar.current) -> [Trip] {
        trips.filter { calendar.startOfDay(for: $0.plannedRoute.startsAt) == dateKey }
            .sorted(by: { $0.plannedRoute.endsAt < $1.plannedRoute.endsAt } )
    }
}

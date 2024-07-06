//
//  MyRidesHelperTests.swift
//  MyRidesTests
//
//  Created by Ralston Goes on 7/6/24.
//

import XCTest
@testable import MyRides

class MyRidesHelperTests: XCTestCase {
    
    var dateTimeformatter: DateFormatter!
    var calendar: Calendar!
    
    override func setUp() {
        super.setUp()
        
        calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    }
    
    override func tearDown() {
        dateTimeformatter = nil
        super.tearDown()
    }
    
    func test_fetchTripDates_empty() {
        XCTAssertEqual(MyRidesHelper.fetchTripDates([]).count, 0)
    }
    
    func test_fetchTripDates_sortedUniqueDates() {
        let expectedResult = [
            calendar.startOfDay(for: ISO8601DateFormatter().date(from: "2024-05-22T00:00:00Z")!),
            calendar.startOfDay(for: ISO8601DateFormatter().date(from: "2024-07-01T18:15:00Z")!),
            calendar.startOfDay(for: ISO8601DateFormatter().date(from: "2024-07-03T09:15:00Z")!),
        ]
        XCTAssertEqual(MyRidesHelper.fetchTripDates(MockTripsData.multipleTrips, calendar), expectedResult)
    }
    
    func test_fetchSortedTripsFor_missingDate() {
        let missingDate = calendar.startOfDay(for: ISO8601DateFormatter().date(from: "2024-07-04T18:15:00Z")!)
        XCTAssertEqual(MyRidesHelper.fetchSortedTripsFor(dateKey: missingDate, MockTripsData.multipleTrips, calendar).count, 0)
    }
    
    func test_fetchSortedTripsFor_existingDateSingleTrip() {
        let singleTripDate = calendar.startOfDay(for: ISO8601DateFormatter().date(from: "2024-07-01T18:15:00Z")!)
        XCTAssertEqual(MyRidesHelper.fetchSortedTripsFor(dateKey: singleTripDate, MockTripsData.multipleTrips, calendar).count, 1)
    }
    
    func test_fetchSortedTripsFor_existingDateMultipleTrips() {
        let multipleDate1 = ISO8601DateFormatter().date(from: "2024-07-03T09:15:00Z")!
        let multipleDate1Key = calendar.startOfDay(for: multipleDate1)
        let result1 = MyRidesHelper.fetchSortedTripsFor(dateKey: multipleDate1Key, MockTripsData.multipleTrips, calendar)
        XCTAssertEqual(result1.count, 2)
        XCTAssertEqual(result1.first!.plannedRoute.startsAt, multipleDate1)
        
        let multipleDate2 = ISO8601DateFormatter().date(from: "2024-05-22T23:59:59Z")!
        let multipleDate2Key = calendar.startOfDay(for: multipleDate2)
        let result2 = MyRidesHelper.fetchSortedTripsFor(dateKey: multipleDate2Key, MockTripsData.multipleTrips, calendar)
        XCTAssertEqual(result2.count, 2)
        XCTAssertEqual(result2.last!.plannedRoute.startsAt, multipleDate2)
    }
}

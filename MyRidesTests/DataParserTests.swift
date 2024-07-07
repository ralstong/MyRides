//
//  DataParserTests.swift
//  MyRidesTests
//
//  Created by Ralston Goes on 7/6/24.
//

import XCTest
@testable import MyRides

final class DataParserTests: XCTestCase {
    
    let iso8601DateFormatter = ISO8601DateFormatter()

    func testDecodingTripResponse() {
        guard let url = Bundle(for: DataParserTests.self).url(forResource: "TripSampleResponse", withExtension: "json") else {
            XCTFail("Could not find TripSampleResponse JSON file")
            return
        }
        guard let data: Data = NSData(contentsOf: url) as Data? else {
            XCTFail("Could not retrieve TripSampleResponse JSON data")
            return
        }
        guard let sampleResponse: TripInfo = try? DataParser.parse(data) else {
            XCTFail("Could not decode TripSampleResponse JSON data")
            return
        }
        
        XCTAssertEqual(sampleResponse.trips.count, 4)
        XCTAssertEqual(sampleResponse.trips.first!.estimatedEarnings, 1736)
        XCTAssertEqual(sampleResponse.trips.first!.plannedRoute.startsAt, iso8601DateFormatter.date(from: "2023-11-16T18:15:00Z"))
        XCTAssertEqual(sampleResponse.trips.first!.plannedRoute.endsAt, iso8601DateFormatter.date(from: "2023-11-16T18:40:55Z"))
        XCTAssertEqual(sampleResponse.trips.first!.passengers.count, 3)
        XCTAssertEqual(sampleResponse.trips.first!.passengers.first!.boosterSeat, false)
        XCTAssertEqual(sampleResponse.trips.first!.waypoints.count, 3)
        XCTAssertEqual(sampleResponse.trips.first!.waypoints.first!.id, 1252826)
        XCTAssertEqual(sampleResponse.trips.first!.waypoints.first!.location.address, "101 Main St, Huntington Beach, CA 92648, USA")
    }
}

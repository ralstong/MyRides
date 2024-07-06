//
//  DateExtensionTests.swift
//  MyRidesTests
//
//  Created by Ralston Goes on 7/5/24.
//

import XCTest
@testable import MyRides

class DateExtensionTests: XCTestCase {
    
    var dateTimeformatter: DateFormatter!
    
    override func setUp() {
        super.setUp()
        dateTimeformatter = DateFormatter()
        dateTimeformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    }
    
    override func tearDown() {
        dateTimeformatter = nil
        super.tearDown()
    }
    
    // MARK: test getWeekAndDate() function
    func test_getWeekAndDate_singleDigitMonthAndDay() {
        let date = dateTimeformatter.date(from: "2024-07-05T23:12:12Z")
        XCTAssertEqual(date?.getWeekAndDate(), "Fri 7/5")
    }
    
    func test_getWeekAndDate_DoubleDigitsMonthAndDay() {
        let date = dateTimeformatter.date(from: "2024-11-14T00:12:12Z")
        XCTAssertEqual(date?.getWeekAndDate(), "Thu 11/14")
    }
    
    // MARK: test getTime() function
    func test_getTime_amAndSingleDigitHour() {
        let date = dateTimeformatter.date(from: "2024-11-14T04:12:12Z")
        XCTAssertEqual(date?.getTime(), "4:12a")
    }
    
    func test_getTime_pm() {
        let date = dateTimeformatter.date(from: "2024-11-14T13:04:12Z")
        XCTAssertEqual(date?.getTime(), "1:04p")
    }
    
    func test_getTime_midnight() {
        let date = dateTimeformatter.date(from: "2024-11-14T00:00:00Z")
        XCTAssertEqual(date?.getTime(), "12:00a")
    }
    
    func test_getTime_SingleDigitHour() {
        let date = dateTimeformatter.date(from: "2024-11-14T14:59:12Z")
        XCTAssertEqual(date?.getTime(), "2:59p")
    }
    
    func test_getTime_DoubleDigitHour() {
        let date = dateTimeformatter.date(from: "2024-11-14T22:04:12Z")
        XCTAssertEqual(date?.getTime(), "10:04p")
    }
}

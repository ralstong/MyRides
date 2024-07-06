//
//  NumberExtensionTests.swift
//  MyRidesTests
//
//  Created by Ralston Goes on 7/5/24.
//

import XCTest
@testable import MyRides

final class NumberExtensionTests: XCTestCase {
    
    func test_dollarAmount_zero() {
        let zero: Double = .zero
        XCTAssertEqual(zero.dollarAmount(), "$0.00")
    }
    
    func test_dollarAmount_DollarsAndCents() {
        let zero: Double = 12345
        XCTAssertEqual(zero.dollarAmount(), "$123.45")
    }
    
    func test_dollarAmount_OnlyCents() {
        let zero: Double = 04
        XCTAssertEqual(zero.dollarAmount(), "$0.04")
    }

}

//
//  MyRidesViewModelTests.swift
//  MyRidesTests
//
//  Created by Ralston Goes on 7/5/24.
//

import XCTest
import Combine
@testable import MyRides

final class MyRidesViewModelTests: XCTestCase {
    
    var vm: MyRidesViewModel!
    var mockService = MockTripsAPI()

    override func setUpWithError() throws {
        vm = MyRidesViewModel(tripsService: mockService)
    }

    override func tearDownWithError() throws {
        vm = nil
    }
    
    func test_initialValue() {
        XCTAssertEqual(vm.trips.count, 0)
    }
    
    func test_loadTripsFailure() async {
        let expectation = expectation(description: "Load trips request should fail")
        mockService.forceFailure = true
        await vm.loadTrips()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            XCTAssertEqual(self?.vm.trips.count, 0)
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 3)
    }
    
    func test_loadTripsSuccess() async {
        let expectation = expectation(description: "Load trips request should succeed")
        var subscriber: AnyCancellable? = vm.shouldUpdate
            .receive(on: DispatchQueue.main)
            .sink { success in
                XCTAssertTrue(success)
                expectation.fulfill()
            }
        await vm.loadTrips()
        await fulfillment(of: [expectation], timeout: 3)
        subscriber?.cancel()
        subscriber = nil
    }
    
}

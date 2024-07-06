//
//  MyRidesViewModel.swift
//  MyRides
//
//  Created by Ralston Goes on 6/28/24.
//

import Foundation
import Combine

class MyRidesViewModel {
    
    private let tripsService: TripsService
    private(set) var trips = [Trip]()
    var shouldUpdate = PassthroughSubject<Bool, Never>()
    
    init(tripsService: TripsService) {
        self.tripsService = tripsService
    }
    
    /// fetch and load the trips
    func loadTrips() async {
        do {
            let tripInfo = try await tripsService.fetchRides()
            trips = tripInfo.trips
            shouldUpdate.send(true)
        } catch let apiError as APIError {
            print("API Error: \(apiError.description)")
            shouldUpdate.send(false)
        } catch {
            print("Error: \(error.localizedDescription)")
            shouldUpdate.send(false)
        }
    }
    
}

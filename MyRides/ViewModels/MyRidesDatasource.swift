//
//  MyRidesDatasource.swift
//  MyRides
//
//  Created by Ralston Goes on 7/1/24.
//

import Foundation
import UIKit
import Combine

/// Protocol delegate for MyRides tableview datasource
protocol MyRidesSourceDelegate: AnyObject {
    func rowTapped()
}

/// Datasource and delegate class for the MyRides tableview
class MyRidesDatasource: NSObject {
    
    // Array containing the ordered dates for each section
    private var sections = [Date]()
    // Array containing all trips
    var trips = [Trip]() {
        didSet {
            sections = MyRidesHelper.fetchTripDates(trips)
        }
    }
    
    weak var delegate: MyRidesSourceDelegate?
}

extension MyRidesDatasource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = sections[section]
        return MyRidesHelper.fetchSortedTripsFor(dateKey: key, trips).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TripCardCell.reuseId, for: indexPath) as? TripCardCell else {
            return UITableViewCell()
        }
        
        let key = sections[indexPath.section]
        let allTrips = MyRidesHelper.fetchSortedTripsFor(dateKey: key, trips)
        let ride = allTrips[indexPath.row]
        
        cell.configure(rideInfo: ride)
        return cell
    }
}

extension MyRidesDatasource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TripHeader.reuseId) as? TripHeader else {
            return nil
        }
        let sectionDate = sections[section]
        sectionView.configure(date: sectionDate,
                              trips: MyRidesHelper.fetchSortedTripsFor(dateKey: sectionDate, trips))
        return sectionView
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.rowTapped()
    }
}

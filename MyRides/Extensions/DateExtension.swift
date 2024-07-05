//
//  DateHelper.swift
//  MyRides
//
//  Created by Ralston Goes on 7/1/24.
//

import Foundation

extension Date {
    
    /// get week and date formatted string, eg. Fri 7/5
    func getWeekAndDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "eee M/d"
        return dateFormatter.string(from: self)
    }
    
    /// get time formatted string, eg. 12:04p
    func getTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mma"
        dateFormatter.amSymbol = "a"
        dateFormatter.pmSymbol = "p"
        return dateFormatter.string(from: self)
    }
    
}

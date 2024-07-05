//
//  NumberExtension.swift
//  MyRides
//
//  Created by Ralston Goes on 7/1/24.
//

import Foundation

extension Double {
    
    /// get dollar amount string from value in cents
    func dollarAmount() -> String {
        "$\(self / 100.0)"
    }
}

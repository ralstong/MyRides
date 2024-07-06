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
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "en_US")
        return numberFormatter.string(from: NSNumber(value: (self / 100.0))) ?? ""
    }
}

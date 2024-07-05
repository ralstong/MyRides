//
//  CALayerExtension.swift
//  MyRides
//
//  Created by Ralston Goes on 7/3/24.
//

import UIKit

extension CALayer {
    func addShadow(color: UIColor,
                    x: CGFloat = 0,
                    y: CGFloat = 0,
                    blur: CGFloat = 0,
                    spread: CGFloat = 0,
                    opacity: Float = 1) {
        shadowColor = color.cgColor
        shadowOpacity = opacity
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2
        if spread == 0 {
            shadowPath = nil
        } else {
            let rect = bounds.insetBy(dx: -spread, dy: -spread)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

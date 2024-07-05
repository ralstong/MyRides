//
//  HSDButton.swift
//  MyRides
//
//  Created by Ralston Goes on 7/5/24.
//

import UIKit

/// Custom button that supports theme color and title customization based on a given Style
class HSDButton: UIButton {
    
    enum Style {
        case primary
        case secondary
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 2.0
    }
    
    func configure(style: HSDButton.Style, color: UIColor, title: String) {
        switch style {
        case .primary:
            backgroundColor = color
            setTitleColor(.white, for: .normal)
        case .secondary:
            backgroundColor = .white
            setTitleColor(color, for: .normal)
        }
        setTitle(title, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 16.0)
    }
}

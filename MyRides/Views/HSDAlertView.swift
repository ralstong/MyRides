//
//  HSDAlertView.swift
//  MyRides
//
//  Created by Ralston Goes on 7/3/24.
//

import UIKit

/// Protocol delegate for the HSD alert view actions
protocol HSDAlertViewDelegate: AnyObject {
    func dismissAction()
}

/// Custom reusable alert view that supports upto 6 buttons
class HSDAlertView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textColor = .hsdBlack
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16.0)
        label.textColor = .hsdGrey
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.tintColor = .hsdBlack
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        return button
    }()
    
    private let buttonStack: UIStackView = {
        let vstack = UIStackView()
        vstack.axis = .vertical
        vstack.spacing = 8.0
        return vstack
    }()
    
    private let maxButtonsSupported = 6 // Limit max 6 buttons to account for small screen sizes
    weak var delegate: HSDAlertViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 20.0
        
        [closeButton, titleLabel, detailLabel, buttonStack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 16.0).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor, multiplier: 1.0).isActive = true
        closeButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 16.0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0).isActive = true
        
        addSubview(detailLabel)
        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32.0).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32.0).isActive = true
        
        addSubview(buttonStack)
        buttonStack.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 8.0).isActive = true
        buttonStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32.0).isActive = true
        buttonStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32.0).isActive = true
        buttonStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, detail: String, buttons: [(title: String, style: HSDButton.Style)], 
                   titleAlignment: NSTextAlignment, detailAlignment: NSTextAlignment, themeColor: UIColor) {
        
        titleLabel.text = title
        titleLabel.textAlignment = titleAlignment
        detailLabel.text = detail
        detailLabel.textAlignment = detailAlignment
        
        // setup upto first 6 buttons for alert view
        for i in 0..<buttons.count {
            guard i < maxButtonsSupported else { break }
            let button = buttons[i]
            let alertButton = HSDButton()
            alertButton.configure(style: button.style, color: themeColor, title: button.title)
            alertButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            alertButton.translatesAutoresizingMaskIntoConstraints = false
            alertButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
            buttonStack.addArrangedSubview(alertButton)
        }
    }
    
    @objc private func buttonTapped(_ sender: HSDButton) {
        delegate?.dismissAction()
    }
}

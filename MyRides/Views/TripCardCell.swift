//
//  TripCardCell.swift
//  MyRides
//
//  Created by Ralston Goes on 6/28/24.
//

import UIKit

class TripCardCell: UITableViewCell {
    
    static let reuseId = "\(TripCardCell.self)"
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.addShadow(color: .black, x: 0.0, y: 2.0, blur: 5.0, opacity: 0.14)
        return view
    }()
    
    private let startTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textColor = .hsdGrey
        return label
    }()
    
    private let endTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.textColor = .hsdGrey
        return label
    }()
    
    private let passengersLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0)
        label.textColor = .hsdGrey
        return label
    }()
    
    private let estLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10.0)
        label.text = TripCardText.estimateAbbreviation
        label.textColor = .hsdBlue
        return label
    }()
    
    private let estEarningLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.textColor = .hsdBlue
        return label
    }()
    
    private let waypointsStack: UIStackView = {
        let vstack = UIStackView()
        vstack.axis = .vertical
        vstack.spacing = 2.0
        return vstack
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        for subview in waypointsStack.subviews {
            subview.removeFromSuperview()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        [cardView, startTimeLabel, endTimeLabel, passengersLabel, estLabel, estEarningLabel, waypointsStack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        contentView.addSubview(cardView)
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2.0).isActive = true
        cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0).isActive = true
        cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16.0).isActive = true
        cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0).isActive = true
        
        cardView.addSubview(startTimeLabel)
        startTimeLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20.0).isActive = true
        startTimeLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16.0).isActive = true
        
        cardView.addSubview(endTimeLabel)
        endTimeLabel.centerYAnchor.constraint(equalTo: startTimeLabel.centerYAnchor).isActive = true
        endTimeLabel.leadingAnchor.constraint(equalTo: startTimeLabel.trailingAnchor).isActive = true
        
        cardView.addSubview(passengersLabel)
        passengersLabel.centerYAnchor.constraint(equalTo: startTimeLabel.centerYAnchor).isActive = true
        passengersLabel.leadingAnchor.constraint(equalTo: endTimeLabel.trailingAnchor, constant: 2.0).isActive = true
        
        cardView.addSubview(estEarningLabel)
        estEarningLabel.centerYAnchor.constraint(equalTo: startTimeLabel.centerYAnchor).isActive = true
        estEarningLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16.0).isActive = true
        
        cardView.addSubview(estLabel)
        estLabel.lastBaselineAnchor.constraint(equalTo: estEarningLabel.lastBaselineAnchor).isActive = true
        estLabel.trailingAnchor.constraint(equalTo: estEarningLabel.leadingAnchor).isActive = true
        
        cardView.addSubview(waypointsStack)
        waypointsStack.topAnchor.constraint(equalTo: startTimeLabel.bottomAnchor, constant: 16.0).isActive = true
        waypointsStack.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16.0).isActive = true
        waypointsStack.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16.0).isActive = true
        waypointsStack.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(rideInfo: Trip) {
        startTimeLabel.text = rideInfo.plannedRoute.startsAt.getTime()
        endTimeLabel.text = " - " + rideInfo.plannedRoute.endsAt.getTime()
        passengersLabel.text = getRidersString(rideInfo.passengers)
        estEarningLabel.text = rideInfo.estimatedEarnings.dollarAmount()
        populateWaypoints(rideInfo.waypoints)
    }
    
}

// MARK: Helper methods
extension TripCardCell {
    
    private func getRidersString(_ riders: [Passenger]) -> String {
        let riderCount = riders.count
        let boosterCount = riders.filter { $0.boosterSeat }.count
        return "(\(riderCount) rider\(riderCount > 1 ? "s": "")\(boosterCount > 0 ? (" · \(boosterCount) booster\(boosterCount > 1 ? "s": "")"): ""))"
    }
    
    private func populateWaypoints(_ waypoints: [Waypoint]) {
        for i in 0..<waypoints.count {
            let hstack = getAddressHstack()
            let indexLabel = getWaypointLabel(with: "\(String(i+1)).")
            indexLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
            let addressLabel = getWaypointLabel(with: waypoints[i].location.address)
            addressLabel.numberOfLines = 0
            hstack.addArrangedSubview(indexLabel)
            hstack.addArrangedSubview(addressLabel)
            waypointsStack.addArrangedSubview(hstack)
        }
    }
    
    private func getAddressHstack() -> UIStackView {
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.spacing = 2.0
        hStack.alignment = .firstBaseline
        hStack.translatesAutoresizingMaskIntoConstraints = false
        return hStack
    }
    
    private func getWaypointLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.textColor = .hsdGrey
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

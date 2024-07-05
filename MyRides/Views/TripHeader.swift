//
//  TripHeader.swift
//  MyRides
//
//  Created by Ralston Goes on 7/1/24.
//

import UIKit

class TripHeader: UITableViewHeaderFooterView {
    
    static let reuseId = "\(TripHeader.self)"
    
    private let containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.addShadow(color: .black, x: 0.0, y: 1.0, blur: 3.0, opacity: 0.14)
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.hsdGrey.withAlphaComponent(0.14).cgColor
        return view
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .hsdBlue
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        return label
    }()
    
    private let startTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .hsdGrey
        label.font = .systemFont(ofSize: 12.0, weight: .bold)
        return label
    }()
    
    private let endTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .hsdGrey
        label.font = .systemFont(ofSize: 12.0)
        return label
    }()
    
    private let vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .trailing
        return stack
    }()
    
    private let estLabel: UILabel = {
        let label = UILabel()
        label.text = TripHeaderText.estimated.uppercased()
        label.textColor = .hsdGrey
        label.font = .systemFont(ofSize: 10.0)
        return label
    }()
    
    private let estEarningLabel: UILabel = {
        let label = UILabel()
        label.textColor = .hsdBlue
        label.font = .systemFont(ofSize: 16.0)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        
        [dateLabel, startTimeLabel, endTimeLabel, vStack, estLabel, estEarningLabel, containerView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        contentView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14.0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        containerView.addSubview(vStack)
        vStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16.0).isActive = true
        vStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0).isActive = true
        vStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16.0).isActive = true
        
        vStack.addArrangedSubview(estLabel)
        vStack.addArrangedSubview(estEarningLabel)
        
        containerView.addSubview(dateLabel)
        dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: vStack.centerYAnchor).isActive = true
        
        containerView.addSubview(startTimeLabel)
        startTimeLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 4.0).isActive = true
        startTimeLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor).isActive = true
        
        containerView.addSubview(endTimeLabel)
        endTimeLabel.leadingAnchor.constraint(equalTo: startTimeLabel.trailingAnchor).isActive = true
        endTimeLabel.centerYAnchor.constraint(equalTo: startTimeLabel.centerYAnchor).isActive = true
        endTimeLabel.trailingAnchor.constraint(lessThanOrEqualTo: vStack.leadingAnchor, constant: -8.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(date: Date, trips: [Trip]) {
        dateLabel.text = date.getWeekAndDate()
        startTimeLabel.text = " · \(trips.first?.plannedRoute.startsAt.getTime() ?? "")"
        endTimeLabel.text = " - \(trips.last?.plannedRoute.endsAt.getTime() ?? "")"
        estEarningLabel.text = trips.reduce(0) { $0 + $1.estimatedEarnings }.dollarAmount()
    }
}

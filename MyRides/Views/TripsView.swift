//
//  TripsView.swift
//  MyRides
//
//  Created by Ralston Goes on 7/1/24.
//

import UIKit

class TripsView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TripCardCell.self, forCellReuseIdentifier: TripCardCell.reuseId)
        tableView.register(TripHeader.self, forHeaderFooterViewReuseIdentifier: TripHeader.reuseId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.sectionHeaderTopPadding = .leastNonzeroMagnitude
        tableView.sectionFooterHeight = 0.0
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "No trips found."
        label.textColor = .hsdBlack
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(emptyLabel)
        emptyLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emptyLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        emptyLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        
        addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
    
    func configure(isEmpty: Bool = false) {
        tableView.isHidden = isEmpty
    }
    
}

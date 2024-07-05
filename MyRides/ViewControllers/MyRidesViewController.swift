//
//  ViewController.swift
//  MyRides
//
//  Created by Ralston Goes on 6/28/24.
//

import UIKit
import Combine

/// ViewController class that displays all the scheduled rides
class MyRidesViewController: UIViewController {
    
    let viewModel: MyRidesViewModel
    let tripsView: TripsView
    let datasource: MyRidesDatasource
    private var subscriber: AnyCancellable?
    
    init(viewModel: MyRidesViewModel = MyRidesViewModel(tripsService: TripsAPI()),
         view: TripsView = TripsView(),
         datasource: MyRidesDatasource = MyRidesDatasource()) {
        self.viewModel = viewModel
        self.tripsView = view
        self.datasource = datasource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(tripsView)
        tripsView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.title = "My Rides"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datasource.delegate = self
        tripsView.tableView.delegate = datasource
        tripsView.tableView.dataSource = datasource
        setupBindings()
        Task {
            await viewModel.loadTrips()
        }
    }
    
    private func setupBindings() {
        subscriber = viewModel.shouldUpdate
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] hasData in
                guard let self else { return }
                guard hasData else {
                    // show empty/error state
                    self.tripsView.configure(isEmpty: true)
                    return
                }
                // proceed to populate table
                self.datasource.trips = self.viewModel.trips
                self.tripsView.reloadTable()
                self.tripsView.configure()
            })
    }
}

extension MyRidesViewController: MyRidesSourceDelegate {

    func rowTapped() {
        let alertView = HSDAlertView()
        let alertButtons: [(title: String, style: HSDButton.Style)] = [
            (title: TripAlertText.optOut, style: .primary),
            (title: TripAlertText.confirm, style: .secondary)
        ]
        alertView.configure(title: TripAlertText.title, detail: TripAlertText.detail, buttons: alertButtons, titleAlignment: .center, detailAlignment: .left, themeColor: .hsdBlue)
        showDetailViewController(HSDAlertViewController(alertView: alertView), sender: nil)
    }
}

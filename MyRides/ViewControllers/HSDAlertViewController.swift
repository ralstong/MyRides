//
//  HSDAlertViewController.swift
//  MyRides
//
//  Created by Ralston Goes on 7/5/24.
//

import UIKit

/// Custom alert view controller that initializes with a customizable alert view
class HSDAlertViewController: UIViewController {
    
    private let alertView: HSDAlertView
    
    init(alertView: HSDAlertView) {
        self.alertView = alertView
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupBGView()
        setupAlertView()
    }
    
    private func setupBGView() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blurEffectView)
        blurEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blurEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        blurEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupAlertView() {
        alertView.delegate = self
        alertView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alertView)
        alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        alertView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        alertView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 16.0).isActive = true
        alertView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16.0).isActive = true
    }
}

extension HSDAlertViewController: HSDAlertViewDelegate {
    func dismissAction() {
        dismiss(animated: true)
    }
}

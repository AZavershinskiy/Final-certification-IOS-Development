//
//  TabBarController.swift
//  AirportBoard
//
//  Created by Andrey Zavershinskiy on 29.01.2024.
//
// MARK: -  Setting up the Tab Bar Controller

import UIKit

final class TabBarController: UITabBarController {

	private lazy var banner = BannerView()

	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupTabBar()
		setupView()
	}

	// MARK: - Display settings
	private func setupView() {
		view.backgroundColor = .systemBackground
		view.addSubview(banner)
		setupBannerConstraints()
	}

	private func setupBannerConstraints() {
		banner.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			banner.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: -10),
			banner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			banner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
		])
	}

	// MARK: - Setting up the Tab Bar
	private func setupTabBar() {
		let tabDepartures = UINavigationController(rootViewController: DeparturesViewController())
		tabDepartures.tabBarItem.title = "Departures"
		tabDepartures.tabBarItem.image = UIImage(systemName: "airplane.departure")

		let tabArrivals = UINavigationController(rootViewController: ArrivalsViewController())
		tabArrivals.tabBarItem.title = "Arrivals"
		tabArrivals.tabBarItem.image = UIImage(systemName: "airplane.arrival")

		viewControllers = [tabDepartures, tabArrivals]

	}
}

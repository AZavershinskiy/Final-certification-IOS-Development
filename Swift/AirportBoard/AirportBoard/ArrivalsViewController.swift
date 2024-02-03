//
//  ArrivalsViewController.swift
//  AirportBoard
//
//  Created by Andrey Zavershinskiy on 29.01.2024.
//
// MARK: - Arrival List Controller settings

import UIKit

final class ArrivalsViewController: UITableViewController {

	private lazy var networkService = NetworkService()
	private var arrivals = [Flight]()

	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		updateList()
	}

	// MARK: - Setting the display of Arrival Flights on the screen
	private func setupView() {
		title = "Arrivals"
		tableView.register(ArrivalCell.self, forCellReuseIdentifier: Constants.Identifier.cellIdentifier)
		refreshControl = UIRefreshControl()
		refreshControl?.addTarget(self, action: #selector(updateList), for: .valueChanged)
	}

	// MARK: - Amount of lines
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		arrivals.count
	}

	// MARK: - Displaying elements in a cell
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifier.cellIdentifier, for: indexPath) as? ArrivalCell else { return UITableViewCell() }
		cell.updateCell(flight: arrivals[indexPath.row])

		/// Transition from Сell to FlightDetailsController
		cell.tap = { [weak self] number, title, vehicle, time in
			self?.navigationController?.pushViewController(FlightDetailsController(number: number, titleFlight: title, vehicle: vehicle, eventTime: time), animated: true)
		}
		return cell
	}

	// MARK: - Error Notification Settings
	private func showAlert() {
		let alert = UIAlertController(title: "List update error", message: "Please try again or check your internet connection", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Close", style: .default))
		present(alert, animated: true)
	}
}

// MARK: - @objc methods
private extension ArrivalsViewController {

	/// Method for updating the Arrival  List
	@objc func updateList() {
		networkService.getArrivals { [weak self] result in
			switch result {
				case .success(let arrivals):
					DispatchQueue.main.async {
						self?.arrivals = arrivals
						self?.tableView.reloadData()
					}
				case .failure:
					DispatchQueue.main.async {
						self?.showAlert()
					}
			}
			DispatchQueue.main.async {
				self?.refreshControl?.endRefreshing()
			}
		}
	}
}

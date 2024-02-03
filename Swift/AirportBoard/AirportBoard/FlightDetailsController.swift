//
//  FlightDetails.swift
//  AirportBoard
//
//  Created by Andrey Zavershinskiy on 29.01.2024.
//
// MARK: - Flight Details Controller settings

import UIKit

final class FlightDetailsController: UIViewController {

	/// Flight number
	private var number: UILabel = {
		let label = UILabel()
		label.font = .preferredFont(forTextStyle: .title1)
		label.textAlignment = .center
		label.text = "Flight № "
		return label
	}()

	/// Flight name
	private var titleFlight: UILabel = {
		let label = UILabel()
		label.font = .preferredFont(forTextStyle: .title3)
		label.textAlignment = .center
		return label
	}()

	/// Vehicle
	private var vehicle: UILabel = {
		let label = UILabel()
		label.font = .preferredFont(forTextStyle: .title3)
		label.textAlignment = .center
		label.text = "Vehicle: "
		return label
	}()

	/// Event time
	private var eventTime: UILabel = {
		let label = UILabel()
		label.font = .preferredFont(forTextStyle: .largeTitle)
		label.textAlignment = .center
		label.text = "Time: "
		return label
	}()

	// MARK: - Initialization
	init(number: String?, titleFlight: String?, vehicle: String?, eventTime: String?) {
		super.init(nibName: .none, bundle: .none)
		self.number.text! += number ?? "Unknown"
		self.titleFlight.text = titleFlight ?? "Unknown"
		self.vehicle.text! += vehicle ?? "Unknown"
		self.eventTime.text! += eventTime ?? "Unknown"
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		setupView()
	}

	// MARK: - Setting the display of Flight Details on the screen
	private func setupView() {
		title = "Flight details"
		view.addSubview(number)
		view.addSubview(titleFlight)
		view.addSubview(vehicle)
		view.addSubview(eventTime)
		setupConstraints()
	}

	private func setupConstraints() {
		number.translatesAutoresizingMaskIntoConstraints = false
		titleFlight.translatesAutoresizingMaskIntoConstraints = false
		vehicle.translatesAutoresizingMaskIntoConstraints = false
		eventTime.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			number.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			number.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
			number.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),

			titleFlight.topAnchor.constraint(equalTo: number.bottomAnchor, constant: 20),
			titleFlight.leadingAnchor.constraint(equalTo: number.leadingAnchor),
			titleFlight.trailingAnchor.constraint(equalTo: number.trailingAnchor),

			eventTime.topAnchor.constraint(equalTo: titleFlight.bottomAnchor, constant: 20),
			eventTime.leadingAnchor.constraint(equalTo: number.leadingAnchor),
			eventTime.trailingAnchor.constraint(equalTo: number.trailingAnchor),

			vehicle.topAnchor.constraint(equalTo: eventTime.bottomAnchor, constant: 20),
			vehicle.leadingAnchor.constraint(equalTo: number.leadingAnchor),
			vehicle.trailingAnchor.constraint(equalTo: number.trailingAnchor)
		])
	}
}

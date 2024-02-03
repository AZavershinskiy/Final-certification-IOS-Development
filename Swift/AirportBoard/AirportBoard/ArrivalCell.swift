//
//  ArrivalCell.swift
//  AirportBoard
//
//  Created by Andrey Zavershinskiy on 29.01.2024.
//
// MARK: - Arrival cell display settings

import UIKit

final class ArrivalCell: UITableViewCell {

	private lazy var timeFormat = DateConverter()

	/// Passing data from the Arrival Cell to the transition method
	var tap: ((String?, String?, String?, String?) -> Void)?

	/// Flight number
	private var number: UILabel = {
		let label = UILabel()
		label.text = "Number"
		return label
	}()

	/// Flight name
	private var title: UILabel = {
		let label = UILabel()
		label.text = "Title"
		return label
	}()

	/// Vehicle
	private var vehicle: UILabel = {
		let label = UILabel()
		label.text = "Vehicle"
		return label
	}()

	/// Arrival  time
	private var time: UILabel = {
		let label = UILabel()
		label.text = "Arrival time"
		return label
	}()

	// MARK: - Cell initialization
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapCell))
		addGestureRecognizer(tapGestureRecognizer)
		setupViews()
	}
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Reusing a cell in the Arrival List for scrolling
	override func prepareForReuse() {
		super.prepareForReuse()
		number.text = nil
		title.text = nil
		vehicle.text = nil
		time.text = nil
	}

	// MARK: - Updating a cell with data obtained from model
	func updateCell(flight: Flight) {
		number.text = flight.thread.number
		title.text = flight.thread.title
		vehicle.text = flight.thread.vehicle
		time.text = timeFormat.timeInString(time: flight.arrival ?? "Unknown")
	}

	// MARK: - Setting the display of cell elements on the screen
	private func setupViews() {
		contentView.addSubview(number)
		contentView.addSubview(title)
		contentView.addSubview(vehicle)
		contentView.addSubview(time)
		setupConstraints()
	}
	
	private func setupConstraints() {
		number.translatesAutoresizingMaskIntoConstraints = false
		title.translatesAutoresizingMaskIntoConstraints = false
		vehicle.translatesAutoresizingMaskIntoConstraints = false
		time.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			number.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			number.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			number.widthAnchor.constraint(equalToConstant: contentView.frame.size.width / 8 * 7),

			title.topAnchor.constraint(equalTo: number.bottomAnchor, constant: 5),
			title.leadingAnchor.constraint(equalTo: number.leadingAnchor),
			title.widthAnchor.constraint(equalTo: number.widthAnchor),

			vehicle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
			vehicle.leadingAnchor.constraint(equalTo: number.leadingAnchor),
			vehicle.widthAnchor.constraint(equalTo: number.widthAnchor),
			vehicle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

			time.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			time.leadingAnchor.constraint(equalTo: number.trailingAnchor, constant: 25)
		])
	}
}

// MARK: - @objc methods
private extension ArrivalCell {

	/// Method for moving from Arrival Cell to FlightDetails
	@objc func tapCell() {
		tap?(number.text, title.text, vehicle.text, time.text)
	}
}

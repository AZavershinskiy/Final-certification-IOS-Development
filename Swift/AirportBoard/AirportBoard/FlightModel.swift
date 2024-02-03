//
//  FlightModel.swift
//  AirportBoard
//
//  Created by Andrey Zavershinskiy on 29.01.2024.
//
// MARK: - Setting up FlightModel

import Foundation

// MARK: - FlightModel
struct FlightModel: Codable {
	var schedule: [Flight]
}

// MARK: - Schedule
struct Flight: Codable {
	var thread: Thread
	var departure: String?
	var arrival: String?
}

// MARK: - Thread
struct Thread: Codable {
	var number, title, vehicle: String?
}

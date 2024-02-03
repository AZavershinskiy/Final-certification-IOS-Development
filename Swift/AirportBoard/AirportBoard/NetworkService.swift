//
//  NetworkService.swift
//  AirportBoard
//
//  Created by Andrey Zavershinskiy on 29.01.2024.
//
// MARK: - Setting for receiving data from the network

import Foundation

final class NetworkService {
	enum NetworkError: Error {
		case dataError
	}

	private let session = URLSession.shared
	private var today = DateConverter().dateInString(date: .now)

	// MARK: - Getting a list of aircraft Departures
	func getDepartures(completion: @escaping (Result<[Flight], Error>) -> Void) {
		guard let url = URL(string: "https://api.rasp.yandex.net/v3.0/schedule/?apikey=\(ApiKey.key)&station=s9631119&date=\(today)&transport_types=plane&event=departure") else { return }
		print("Departures date: " + today)

		session.dataTask(with: url) { (data, _, error ) in
			guard let data = data else {
				completion(.failure(NetworkError.dataError))
				return
			}

			if let error = error {
				completion(.failure(error))
				return
			}
			do {
				let departures = try JSONDecoder().decode(FlightModel.self, from: data).schedule
				completion(.success(departures))
				print("Departures Model: OK")
			} catch {
				completion(.failure(error))
				print(error)
			}
		}.resume()
	}

	// MARK: - Getting a list of aircraft Arrivals
	func getArrivals(completion: @escaping (Result<[Flight], Error>) -> Void) {
		guard let url = URL(string: "https://api.rasp.yandex.net/v3.0/schedule/?apikey=\(ApiKey.key)&station=s9631119&date=\(today)&transport_types=plane&event=arrival") else { return }
		print("Arrivals date: " + today)

		session.dataTask(with: url) { (data, _, error ) in
			guard let data = data else {
				completion(.failure(NetworkError.dataError))
				return
			}
			if let error = error {
				completion(.failure(error))
				return
			}
			do {
				let arrivals = try JSONDecoder().decode(FlightModel.self, from: data).schedule
				completion(.success(arrivals))
				print("Arrivals Model: OK")
			} catch {
				completion(.failure(error))
				print(error)
			}
		}.resume()
	}
}

extension NetworkService {

	//MARK: - Getting Banner data
	func getBanner(completion: @escaping (Result<Copyright, Error>) -> Void) {
		guard let url = URL(string: "https://api.rasp.yandex.net/v3.0/copyright/?apikey=\(ApiKey.key)&format=json") else { return }
		session.dataTask(with: url) { (data, _, error ) in
			guard let data = data else {
				completion(.failure(NetworkError.dataError))
				return
			}
			if let error = error {
				completion(.failure(error))
				return
			}
			do {
				let banner = try JSONDecoder().decode(BannerModel.self, from: data).copyright
				completion(.success(banner))
				print("Banner Model: OK")
			} catch {
				completion(.failure(error))
				print(error)
			}
		}.resume()
	}
}

//
//  DateConverter.swift
//  AirportBoard
//
//  Created by Andrey Zavershinskiy on 29.01.2024.
//
// MARK: - Methods for converting Date

import Foundation

final class DateConverter {
	/// Method for converting a date with 1 day precision to String
	/// - Parameter date: Incoming Date Argument from timeIntervalSince1970
	/// - Returns: Date after conversion to String
	func dateInString(date: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "YYYY-MM-dd"
//		dateFormatter.locale = Locale(identifier: "ru_RU")
		return dateFormatter.string(from: date)
	}

	/// Method for converting a time with 1 minute  precision to String
	/// - Parameter date: Incoming Date Argument from String in format ISO 8601
	/// - Returns: Time after conversion to String
	func timeInString(time: String) -> String {
		let formatter = ISO8601DateFormatter()
		let timeDate = formatter.date(from: time)!
		let newFormatter = DateFormatter()
		newFormatter.dateFormat = "HH:mm"
		let timeString = newFormatter.string(from: timeDate)
		return timeString
	}
}

//
//  BannerModel.swift
//  AirportBoard
//
//  Created by Andrey Zavershinskiy on 29.01.2024.
//
// MARK: - Setting up a Banner model for Copyright Yandex Schedules

import Foundation

// MARK: - BannerModel
struct BannerModel: Codable {
	var copyright: Copyright
}

// MARK: - Copyright
struct Copyright: Codable {
	var text: String
	var url: String
}

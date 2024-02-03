//
//  BannerView.swift
//  AirportBoard
//
//  Created by Andrey Zavershinskiy on 29.01.2024.
//
// MARK: - Banner View settings

import UIKit

final class BannerView: UIView {

	private var banner: Copyright?
	private lazy var networkService = NetworkService()

	/// Banner text
	private let bannerText: UILabel = {
		let label = UILabel()
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 16)
		label.numberOfLines = 2
		label.textAlignment = .center
		return label
	}()

	/// Banner URL
	private let bannerURL: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = .systemBlue
		label.textAlignment = .center
		label.isUserInteractionEnabled = true
		return label
	}()

	/// Stack Text and URL
	private let stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.alignment = .center
		stackView.distribution = .fillEqually
		stackView.spacing = 10
		return stackView
	}()

	// MARK: - Initialization
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Setting a Banner on the screen
	private func setupView() {
		backgroundColor = .systemYellow
		let tap = UITapGestureRecognizer(target: self, action: #selector(followingLink))
		bannerURL.addGestureRecognizer(tap)
		stackView.addArrangedSubview(bannerText)
		stackView.addArrangedSubview(bannerURL)
		addSubview(stackView)
		updateDataBanner()
		setupConstraints()
	}

	private func setupConstraints() {
		NSLayoutConstraint.activate([
			stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
		])
	}

	// MARK: - Banner update
	private func updateDataBanner() {
		networkService.getBanner { [weak self] result in
			switch result {
				case .success(let banner):
					DispatchQueue.main.async {
						self?.banner = banner
						self?.bannerText.text = self?.banner?.text
						self?.bannerURL.text = self?.banner?.url
					}
				case .failure:
					DispatchQueue.main.async {
						self?.bannerText.text = "Error receiving text"
						self?.bannerURL.text = "Error receiving link"
						self?.bannerURL.textColor = .black
					}
			}
		}
	}
}

// MARK: - @objc methods
private extension BannerView {

	/// Link follow method
	@objc func followingLink() {
		guard let url = URL(string: banner?.url ?? "" ) else { return }
		UIApplication.shared.open(url)
	}
}

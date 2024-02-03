//
//  SceneDelegate.swift
//  AirportBoard
//
//  Created by Andrey Zavershinskiy on 29.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let scene = (scene as? UIWindowScene) else { return }
		window = UIWindow(windowScene: scene)
		window?.rootViewController = TabBarController()
		window?.makeKeyAndVisible()
	}
}

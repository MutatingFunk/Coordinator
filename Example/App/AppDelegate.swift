//
//  AppDelegate.swift
//  CoordinatorExample
//
//  Created by Aleksandar Vacić on 23.11.16..
//  Copyright © 2016. Radiant Tap. All rights reserved.
//

import UIKit

import Coordinator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	let appCoordinator = AppCoordinator()

	func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)

		return true
	}

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		appCoordinator.start()
		window?.rootViewController = appCoordinator.rootViewController
		window?.makeKeyAndVisible()

		return true
	}
}


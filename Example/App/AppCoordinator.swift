//
//  AppCoordinator.swift
//  CoordinatorTest
//
//  Created by Froggatt, James on 31/01/2019.
//  Copyright © 2019 Froggatt, James. All rights reserved.
//

import UIKit

import Coordinator

extension UIResponder {
	@objc dynamic func showDetail(_ date: Date) {
		coordinatingResponder?.showDetail(date)
	}
}

class AppCoordinator: Coordinator<UISplitViewController> {
	
	var secondaryCoordinator: SecondaryCoordinator? {
		// Child coordinators are automatically registered with a string identifier matching the class name.
		// A property can be overridden to return different identifiers per instance.
		return self.childCoordinators["\(SecondaryCoordinator.self)"] as? SecondaryCoordinator
	}
	
	override init(rootViewController: UISplitViewController?) {
		super.init(rootViewController: rootViewController)
		showPrimary()
	}
	
	override func start(with completion: @escaping () -> Void = {}) {
		
		showSecondary(object: nil)
		
		super.start(with: completion)
	}
	
	override func showDetail(_ object: Date) {
		showSecondary(object: object)
	}
	
	private func showPrimary() {
		let primaryNav = UINavigationController()
		rootViewController.viewControllers = [primaryNav]
		
		let primary = PrimaryCoordinator(rootViewController: primaryNav)
		startChild(coordinator: primary)
	}
	private func showSecondary(object: Date?) {
		let secondaryNav = UINavigationController()
		rootViewController.showDetailViewController(secondaryNav, sender: nil)
		
		self.secondaryCoordinator.map {
			self.stopChild(coordinator: $0)
		}
		let secondary = SecondaryCoordinator(rootViewController: secondaryNav, object: object)
		startChild(coordinator: secondary)
	}
}

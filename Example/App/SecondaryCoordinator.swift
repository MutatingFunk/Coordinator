//
//  SecondaryCoordinator.swift
//  CoordinatorTest
//
//  Created by Froggatt, James on 31/01/2019.
//  Copyright © 2019 Froggatt, James. All rights reserved.
//

import UIKit

import Coordinator

class SecondaryCoordinator: UINavigationCoordinator {
	let object: Date?
	
	var secondaryViewController: SecondaryViewController? {
		return rootViewController.viewControllers.first as? SecondaryViewController
	}
	
	init(rootViewController: UINavigationController, object: Date?) {
		self.object = object
		super.init(rootViewController: rootViewController)
	}
	
	override func start(with completion: @escaping () -> () = {}) {
		let vc = SecondaryViewController(detailText: self.object?.description)
		vc.title = "Secondary"
		root(vc)
		
		super.start(with: completion)
	}
}

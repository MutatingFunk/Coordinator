//
//  PrimaryCoordinator.swift
//  CoordinatorTest
//
//  Created by Froggatt, James on 31/01/2019.
//  Copyright © 2019 Froggatt, James. All rights reserved.
//

import UIKit

import Coordinator

protocol PrimaryViewModelling {
	func addObjectAtStart()
	func objectCount() -> Int
	func title(atIndex index: Int) -> String?
	func removeObject(atIndex index: Int)
	
	func selectItem(atIndex index: Int)
}

class PrimaryCoordinator: UINavigationCoordinator {
	override func start(with completion: @escaping () -> () = {}) {
		let vc = PrimaryViewController()
		vc.title = "Primary"
		
		let vm = PrimaryViewModel(rootViewController: vc)
		super.start()
		self.startChild(coordinator: vm)
		
		root(vc)
		
		completion()
	}
}

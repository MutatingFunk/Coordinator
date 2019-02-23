//
//  PrimaryCoordinator.swift
//  CoordinatorTest
//
//  Created by Froggatt, James on 31/01/2019.
//  Copyright © 2019 Froggatt, James. All rights reserved.
//

import UIKit

import Coordinator

extension UIResponder {
	@objc dynamic func addObjectAtStart() {
		coordinatingResponder?.addObjectAtStart()
	}
	@objc dynamic func objectCount() -> Int {
		return coordinatingResponder?.objectCount() ?? 0
	}
	@objc dynamic func title(atIndex index: Int) -> String? {
		return coordinatingResponder?.title(atIndex: index)
	}
	@objc dynamic func removeObject(atIndex index: Int) {
		coordinatingResponder?.removeObject(atIndex: index)
	}
	
	@objc dynamic func selectItem(atIndex index: Int) {
		coordinatingResponder?.selectItem(atIndex: index)
	}
}

class PrimaryCoordinator: UINavigationCoordinator {
	var objects: [Date] = []
	
	override func start(with completion: @escaping () -> () = {}) {
		objects = []
		
		let vc = PrimaryViewController()
		vc.title = "Primary"
		root(vc)
		
		super.start(with: completion)
	}
	
	override func addObjectAtStart() {
		objects.insert(Date(), at: 0)
	}
	
	override func objectCount() -> Int {
		return objects.count
	}
	
	override func title(atIndex index: Int) -> String? {
		guard objects.indices.contains(index) else {
			return nil
		}
		return objects[index].description
	}
	
	override func removeObject(atIndex index: Int) {
		objects.remove(at: index)
	}
	
	override func selectItem(atIndex index: Int) {
		let object = objects[index]
		coordinatingResponder?.showDetail(object)
	}
}

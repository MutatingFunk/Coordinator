//
//  PrimaryViewModel.swift
//  Example
//
//  Created by James Froggatt on 23.02.2019.
//  Copyright © 2019 Radiant Tap. All rights reserved.
//

import Foundation

import Coordinator

class PrimaryViewModel: UICoordinator<PrimaryViewController>, PrimaryViewModelling {
	var objects: [Date] = []
	
	override func start(with completion: @escaping () -> () = {}) {
		objects = []
		
		super.start(with: completion)
	}
	
	func addObjectAtStart() {
		objects.insert(Date(), at: 0)
	}
	
	func objectCount() -> Int {
		return objects.count
	}
	
	func title(atIndex index: Int) -> String? {
		guard objects.indices.contains(index) else {
			return nil
		}
		return objects[index].description
	}
	
	func removeObject(atIndex index: Int) {
		objects.remove(at: index)
	}
	
	func selectItem(atIndex index: Int) {
		let object = objects[index]
		coordinatingResponder(ofType: ObjectShowing.self)?.showObject(object)
	}
}

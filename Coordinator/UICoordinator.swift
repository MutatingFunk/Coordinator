//
//  UICoordinator.swift
//  Coordinator
//
//  Created by James Froggatt on 23.02.2019.
//  Copyright © 2019 Radiant Tap. All rights reserved.
//

import UIKit

///	Main Coordinator instance, where T is UIViewController or any of its subclasses.
open class UICoordinator<T: UIViewController>: Coordinator {
	public let rootViewController: T
	
	
	/// You need to supply UIViewController (or any of its subclasses) that will be loaded as root of the UI hierarchy.
	///	Usually one of container controllers (UINavigationController, UITabBarController etc).
	///
	/// - parameter rootViewController: UIViewController at the top of the hierarchy.
	/// - returns: Coordinator instance, fully prepared but started yet.
	///
	///	Note: if you override this init, you must call `super`.
	public init(rootViewController: T) {
		self.rootViewController = rootViewController
		super.init()
	}
	
	
	//	MARK:- Lifecycle
	
	/// Tells the coordinator to create/display its initial view controller and take over the user flow.
	///	Use this method to configure your `rootViewController` (if it isn't already).
	///
	///	Some examples:
	///	* instantiate and assign `viewControllers` for UINavigationController or UITabBarController
	///	* assign itself (Coordinator) as delegate for the shown UIViewController(s)
	///	* setup closure entry/exit points
	///	etc.
	///
	///	- Parameter completion: An optional `Callback` executed at the end.
	///
	///	Note: if you override this method, you must call `super` and pass the `completion` closure.
	override open func start(with completion: @escaping () -> () = {}) {
		rootViewController.parentCoordinator = self
		super.start(with: completion)
	}
	
	/// Tells the coordinator that it is done and that it should
	///	clear out its backyard.
	///
	///	Possible stuff to do here: dismiss presented controller or pop back pushed ones.
	///
	///	- Parameter completion: Closure to execute at the end.
	///
	///	Note: if you override this method, you must call `super` and pass the `completion` closure.
	override open func stop(with completion: @escaping () -> () = {}) {
		rootViewController.parentCoordinator = nil
		super.stop(with: completion)
	}
	
}

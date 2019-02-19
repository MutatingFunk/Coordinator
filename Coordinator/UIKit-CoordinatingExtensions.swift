//
//  UIKit-CoordinatingExtensions.swift
//  Radiant Tap Essentials
//
//  Copyright © 2016 Radiant Tap
//  MIT License · http://choosealicense.com/licenses/mit/
//

import UIKit

//    Inject parentCoordinator property into all UIViewControllers
extension UIViewController {
    private struct AssociatedKeys {
        static var ViewModel = "ViewModel"
    }
    
    public weak var viewModelResponder: ViewModel? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.ViewModel) as? ViewModel
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.ViewModel, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
}




/**
Driving engine of the message passing through the app, with no need for Delegate pattern nor Singletons.

It piggy-backs on the UIResponder.next? in order to pass the message through UIView/UIVC hierarchy of any depth and complexity.
However, it does not interfere with the regular UIResponder functionality.

At the UIViewController level (see below), it‘s intercepted to switch up to the coordinator, if the UIVC has one.
Once that happens, it stays in the Coordinator hierarchy, since coordinator can be nested only inside other coordinators.
*/
public extension UIResponder {
    public func firstResponder<T>(ofType type: T.Type) -> T? {
        if let self = self as? T {
            return self
        }
        return coordinatingResponder?.firstResponder(ofType: type)
    }
	@objc public var coordinatingResponder: UIResponder? {
		return next
	}

	/*
	// sort-of implementation of the custom message/command to put into your Coordinable extension

	func messageTemplate(args: Whatever, sender: Any?) {
	coordinatingResponder?.messageTemplate(args: args, sender: sender)
	}
	*/
}

extension UIViewController {
    override public var coordinatingResponder: UIResponder? {
        guard let viewModel = self.viewModelResponder else {
            guard let parentController = self.parent else {
                guard let presentingController = self.presentingViewController else {
                    return view.superview
                }
                return presentingController as UIResponder
            }
            return parentController as UIResponder
        }
        return viewModel as UIResponder
    }
}

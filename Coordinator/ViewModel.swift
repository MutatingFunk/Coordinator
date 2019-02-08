//
//  ViewModel.swift
//  Coordinator
//
//  Copyright © 2019 Radiant Tap. All rights reserved.
// 

import Foundation

open class ViewModel: UIResponder {
    public weak var parentCoordinator: Coordinating?
    public init(parentCoordinator: Coordinating?) {
        self.parentCoordinator = parentCoordinator
    }
}

extension ViewModel {
    /**
     Returns `parentCoordinator` if the current UIViewController has one,
     or its view's `superview` if it doesn‘t.
     
     ---
     (Attention: from UIResponder.next documentation)
     
     The UIResponder class does not store or set the next responder automatically,
     instead returning nil by default.
     
     Subclasses must override this method to set the next responder.
     
     UIViewController implements the method by returning its view’s superview;
     UIWindow returns the application object, and UIApplication returns nil.
     ---
     
     We also check are there maybe `parent` UIViewController before finally
     falling back to `view.superview`
     */
    override public var coordinatingResponder: UIResponder? {
        return parentCoordinator as? UIResponder
    }
}

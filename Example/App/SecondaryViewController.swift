//
//  SecondaryViewController.swift
//  CoordinatorTest
//
//  Created by Froggatt, James on 31/01/2019.
//  Copyright © 2019 Froggatt, James. All rights reserved.
//

import UIKit

import Coordinator

class SecondaryViewController: UIViewController {
	
	@IBOutlet weak var detailDescriptionLabel: UILabel!
	
	var detailText: String?
	
	init(detailText: String?) {
		self.detailText = detailText
		super.init(nibName: nil, bundle: nil)
	}
	required init?(coder aDecoder: NSCoder) {
		self.detailText = nil
		super.init(coder: aDecoder)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		detailDescriptionLabel.text = detailText
	}
	
	
}


//
//  PrimaryViewController.swift
//  CoordinatorTest
//
//  Created by Froggatt, James on 31/01/2019.
//  Copyright © 2019 Froggatt, James. All rights reserved.
//

import UIKit

import Coordinator

private let identifier = "Cell"

class PrimaryViewController: UIViewController {
	@IBOutlet private var tableView: UITableView!
	
	var viewModel: PrimaryViewModelling? {
		return self.coordinatingResponder(ofType: PrimaryViewModelling.self)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.leftBarButtonItem = editButtonItem
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
		
		let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
		navigationItem.rightBarButtonItem = addButton
	}
	
	override func setEditing(_ editing: Bool, animated: Bool) {
		tableView.setEditing(editing, animated: animated)
		super.setEditing(editing, animated: animated)
	}
	
	@objc
	func insertNewObject(_ sender: Any) {
		guard let viewModel = self.viewModel else {
			return
		}
		viewModel.addObjectAtStart()
		let indexPath = IndexPath(row: 0, section: 0)
		tableView.insertRows(at: [indexPath], with: .automatic)
	}
}

extension PrimaryViewController: UITableViewDataSource, UITableViewDelegate {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel?.objectCount() ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
		
		cell.textLabel!.text = viewModel?.title(atIndex: indexPath.row)
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		viewModel?.selectItem(atIndex: indexPath.row)
	}
	
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		guard let viewModel = self.viewModel else {
			return
		}
		if editingStyle == .delete {
			viewModel.removeObject(atIndex: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .fade)
		} else if editingStyle == .insert {
			
		}
	}
	
	
}


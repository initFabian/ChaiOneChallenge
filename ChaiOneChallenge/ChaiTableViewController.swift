//
//  ChaiTableViewController.swift
//  ChaiOne Code Challenge
//
//  Created by Fabian Buentello on 3/31/16.
//  Copyright © 2016 Fabian Buentello. All rights reserved.
//

import UIKit

class ChaiTableViewController: UITableViewController {

	var tableUserArr = [User]()
	var chaiDataSource: MyTableDataSource?
	var chaiDelegate: MyTableDelegate?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.registerNib(ChaiCell.nib(), forCellReuseIdentifier: ChaiCell.identifier())
		self.refreshControl?.addTarget(self, action: #selector(reloadTableData), forControlEvents: UIControlEvents.ValueChanged)
		self.reloadTableData()
    }
	
	/**
	Pulling Data From API
	*/
	func reloadTableData() {
		APIManager.getUsers { [weak self](result) in
			switch result {
			case .Success(let users):
				self?.tableUserArr = users
				self?.displayTableData()
			case .Failure(let error):
				print(error)
			}
			self?.refreshControl?.endRefreshing()
		}
	}
	
	func displayTableData() {
		// Setting Table's DataSource
		self.chaiDataSource = MyTableDataSource(items: self.tableUserArr, cellIdentifier: ChaiCell.identifier()) { (cell, item) in
			guard let _cell = cell as? ChaiCell else { return }
			_cell.configureCell(item as! User)
		}
		
		// Setting Table's Delegate
		self.chaiDelegate = MyTableDelegate(cellHeight: UITableViewAutomaticDimension) {
			(_TableView, selectedRowPath) in
				_TableView.deselectRowAtIndexPath(selectedRowPath, animated: true)
		}
		
		
		self.tableView.dataSource = self.chaiDataSource
		self.tableView.delegate = self.chaiDelegate
		self.tableView.reloadData()
	}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
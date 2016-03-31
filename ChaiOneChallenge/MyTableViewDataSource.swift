//
//  MyTableViewDatasource.swift
//  ChaiOne Code Challenge
//
//  Created by Fabian Buentello on 3/31/16.
//  Copyright © 2016 Fabian Buentello. All rights reserved.
//

import UIKit

class MyTableDataSource: NSObject, UITableViewDataSource {
	internal typealias aConfigureCellBlock = (cell:AnyObject, item:AnyObject) -> ()
	
	private var items:[AnyObject]
	private var cellIdentifier:String
	private var configureCellBlock:aConfigureCellBlock
	
	init(items:[AnyObject], cellIdentifier:String, _configureCellBlock:aConfigureCellBlock) {
		
		self.items = items
		self.cellIdentifier = cellIdentifier
		self.configureCellBlock = _configureCellBlock
	}
	
	func itemAtIndexPath(indexPath:NSIndexPath) -> AnyObject {
		return self.items[indexPath.row]
	}
	
	//MARK: UITableViewDataSource
	internal func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath)
		let item:AnyObject = self.itemAtIndexPath(indexPath)
		self.configureCellBlock(cell: cell, item: item)
		return cell
	}
	
}

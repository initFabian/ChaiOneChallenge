//
//  MyTableViewDelegate.swift
//  ChaiOne Code Challenge
//
//  Created by Fabian Buentello on 3/31/16.
//  Copyright © 2016 Fabian Buentello. All rights reserved.
//

import UIKit

class MyTableDelegate: NSObject, UITableViewDelegate {
	internal typealias aDidSelectRowBlock = (myTableView: UITableView, selectedRowPath: NSIndexPath) -> ()
	
	private var cellHeight:CGFloat
	private var selectRowBlock: aDidSelectRowBlock
	
	
	init(cellHeight:CGFloat, didSelectRowBlock:aDidSelectRowBlock) {
		self.cellHeight = cellHeight
		self.selectRowBlock = didSelectRowBlock
	}
	
	//MARK: UITableViewDelegate
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		self.selectRowBlock(myTableView: tableView, selectedRowPath: indexPath)
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return cellHeight
	}
	
	func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return UITableViewAutomaticDimension
	}
	
	//	func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
	//		return 45
	//	}
	//
	//	func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
	//		return 45
	//	}
	
	//	func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
	//
	//	}
	//
	//	func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
	//
	//	}
	
	
}
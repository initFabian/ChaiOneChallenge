//
//  ChaiCell.swift
//  ChaiOne Code Challenge
//
//  Created by Fabian Buentello on 3/31/16.
//  Copyright © 2016 Fabian Buentello. All rights reserved.
//

import UIKit
import WebImage

class ChaiCell: UITableViewCell {
	
	@IBOutlet weak var userNameLabel: UILabel!
	@IBOutlet weak var userTextLabel: UILabel!
	
	@IBOutlet weak var userAvatarImage: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		userAvatarImage.layer.backgroundColor = UIColor.clearColor().CGColor
		userAvatarImage.layer.cornerRadius = userAvatarImage.frame.width/2
		userAvatarImage.layer.masksToBounds = true
	}
	
	class func identifier() -> String {
		return "ChaiCell"
	}
	
	class func nib() -> UINib {
		return UINib(nibName: identifier(), bundle: nil)
	}
	
	func configureCell(user:User) {
		self.userNameLabel?.text = user.userName
		self.userTextLabel?.text = user.userText
		
		// Pull image
		guard let imageUrlString = user.avatarURL else {
				print("didnt pull image")
				return
		}
		
		self.getImage(imageUrlString)
	}
	
	private func getImage(imageUrlString:String) {
		let imageUrl = NSURL(string:imageUrlString)
		self.userAvatarImage?.sd_setImageWithURL(imageUrl)
	}
	
	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		// Configure the view for the selected state
	}
	
}
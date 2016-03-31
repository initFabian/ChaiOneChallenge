//
//  Poster.swift
//  ChaiOne Code Challenge
//
//  Created by Fabian Buentello on 3/31/16.
//  Copyright © 2016 Fabian Buentello. All rights reserved.
//

import UIKit
import SwiftyJSON

public class User: NSObject {

	var userName:String?
	var userText:String?
	var avatarURL:String?
	
	required public init(_ json: JSON) {
		self.userName = json[kUSER][kUSERNAME].string
		self.userText = json[kTEXT].string
		self.avatarURL = json[kUSER][kAVATAR_IMAGE][kURL].string
	}
	
	
}

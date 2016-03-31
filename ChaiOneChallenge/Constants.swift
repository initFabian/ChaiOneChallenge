//
//  Constants.swift
//  ChaiOne Code Challenge
//
//  Created by Fabian Buentello on 3/31/16.
//  Copyright © 2016 Fabian Buentello. All rights reserved.
//

import Foundation

public enum Result<T> {
	case Success(T)
	case Failure(ErrorType)
}

/* ==========================================================================
MARK:- API URLs
========================================================================== */

let API_URL = "https://alpha-api.app.net/stream/0/posts/stream/global"
/* ==========================================================================
MARK:- JSON keys
========================================================================== */

let kUSER = "user"
let kUSERNAME = "username"
let kTEXT = "text"
let kAVATAR_IMAGE = "avatar_image"
let kURL = "url"
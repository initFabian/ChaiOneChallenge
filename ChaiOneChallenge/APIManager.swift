//
//  APIManager.swift
//  ChaiOne Code Challenge
//
//  Created by Fabian Buentello on 3/31/16.
//  Copyright © 2016 Fabian Buentello. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

public typealias myCompletionHandlerType = (Result<[User]>) -> Void

public class APIManager: NSObject {
	
	/**
	Retrieves users from API
	
	- parameter completion: Returns a .Success with data or a Failure with the error.
	*/
	public class func getUsers(completion:myCompletionHandlerType) {
		var users = [User]()
		
		Alamofire.request(.GET, API_URL).validate().responseJSON { response in
			switch response.result {
			case .Success:
				guard let _json = response.result.value,
					array = _json["data"] as? NSArray else {
						let err = NSError(domain: "ShiploopHttpResponseErrorDomain", code: 404, userInfo: [
							NSLocalizedDescriptionKey :  NSLocalizedString("Not Found", value: "Could not retrieve data", comment: ""),
							])
					return completion(Result.Failure(err))
				}
				for user in array {
					let user = User(JSON(user))
					users.append(user)
				}
				return completion(Result.Success(users))
				
			case .Failure(let error):
				print(error)
				return completion(Result.Failure(error))
			}
		}
	}
}

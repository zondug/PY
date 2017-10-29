//
//  GlobalFunctions.swift
//  PY
//
//  Created by Zondug Kim on 2017. 10. 25..
//  Copyright © 2017년 Zondug Kim. All rights reserved.
//

import Foundation
import GameplayKit

class GlobalFunctions {
	
	func rnadom(max: Int) -> Int {
		
		let max = UInt32(max)
		let result = Int(arc4random_uniform(max))
		
		return result
	}
	
	// Seprate rows and cols from the key(String)
	// This function is originally came from a lecture of Realm (https://academy.realm.io/kr/posts/a-neatly-typed-message-improving-code-readability/)
	
	func split(key: String) -> (String, String) {

	let components = key.components(separatedBy: "|")
//		key = "\(rows)|\(cols)"
		let rows = components.first
		let cols = components.last

		return (rows!, cols!)
	}
	
	
}

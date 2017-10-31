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
	
	func random(max: Int) -> Int {
		
		let result = Int(arc4random_uniform(UInt32(max)))
		
		return result
	}
	
	// Seprate rows and cols from the key(String)
	// This function is originally came from a lecture of Realm (https://academy.realm.io/kr/posts/a-neatly-typed-message-improving-code-readability/)
	
	func split(key: String) -> (Int, Int) {

	let components = key.components(separatedBy: "|")
//		key = "\(rows)|\(cols)"
		let rows = Int(components.first!)
		let cols = Int(components.last!)

		return (rows!, cols!)
	}
	
	func combine(x: Int, y: Int) -> String {
		
		let sample = "\(x)|\(y)"
		
		return sample
	}
	
	func convert(key: String) -> String {

		let x = self.split(key: key).0
		let y = self.split(key: key).1
		
		let xy = "\(x)|\(y)"
		
		return xy
	}
	
}

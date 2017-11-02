//
//  GlobalFunctions.swift
//  PY
//
//  Created by Zondug Kim on 2017. 10. 25..
//  Copyright © 2017년 Zondug Kim. All rights reserved.
//

import Foundation
import GameplayKit

/// Normal Arc4Random number
class GlobalFunctions {
	
	func random(max: Int) -> Int {
		
		let result = Int(arc4random_uniform(UInt32(max)))
		
		return result
	}

	/// Gaussian Random distribution
	///
	/// - Returns: Pick a gaussian distributed random number between min ~ max
	func random(min: Int, max: Int) -> Int {
		
		let getRand = GKGaussianDistribution(randomSource: GKRandomSource(), lowestValue: min, highestValue: max)
		
		return getRand.nextInt()
	}
	
	/// D20
	///
	/// - Returns: d20 random distribution, 1~20
	func random() -> Int {
		//
		
		let d20 = GKRandomDistribution.d20()
		
		return d20.nextInt()
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

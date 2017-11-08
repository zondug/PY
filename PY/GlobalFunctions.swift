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
	
	/// 일반 Arc4Random
	func random(max: Int) -> Int {
		
		let result = Int(arc4random_uniform(UInt32(max)))
		
		return result
	}

	/// 정규 분포 랜덤
	///
	/// - Returns: Pick a gaussian distributed random number between min ~ max
	func random(min: Int, max: Int) -> Int {
		
		let getRand = GKGaussianDistribution(randomSource: GKRandomSource(), lowestValue: min, highestValue: max)
		
		return getRand.nextInt()
	}
	
	/// D20 랜덤
	///
	/// - Returns: d20 random distribution, 1~20
	func random() -> Int {
		//
		
		let d20 = GKRandomDistribution.d20()
		
		return d20.nextInt()
	}

	// Seprate rows and cols from the key(String)
	// This function is originally came from a lecture of Realm (https://academy.realm.io/kr/posts/a-neatly-typed-message-improving-code-readability/)
	
	/// key를 받아서 x, y 좌표로 분리함
	///
	/// - Returns: 리턴 값은 .0, .1로 접근 가능함
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
	
	// 이건 왜 만들었지?
	func convert(key: String) -> String {

		let x = self.split(key: key).0
		let y = self.split(key: key).1
		
		let xy = "\(x)|\(y)"
		
		return xy
	}
	
	func updateTimer() {
		
		var realsecond = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(global.timecounterIncrease)), userInfo: nil, repeats: true)
	
	}
	
	@objc func timecounterIncrease() {
//		print("got the timer")
		
		if timecounter < 10 {
			timerbar["\(timecounter)"]?.isHidden = false
			timecounter = timecounter + 1
		} else if timecounter == 10 {
			for i in 0...9 {
				timerbar["\(i)"]?.isHidden = true
			}
			timecounter = 0
		}
		
		effect.pop(key: "4|4")
		
	}
	
}

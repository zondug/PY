//
//  Actors.swift
//  PY
//
//  Created by Zondug Kim on 2017. 10. 7..
//  Copyright © 2017년 Zondug Kim. All rights reserved.
//

import Foundation

class Actors {

	private var _hp: Int = 100;
	
	var name: String?
	var position: String?
	var language: language
	var attitude: attitude
	
	var hp: Int {
		get {
			return _hp;
		}
	}
	
	init(name: String, position: String, language: language, attitude: attitude) {
		self.name = name
		self.position = position
		self.language = language
		self.attitude = attitude
	}
}

class Enemy: Actors {
	
	
	
}

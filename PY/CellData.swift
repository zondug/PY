//
//  CellData.swift
//  PY
//
//  Created by Zondug Kim on 2017. 10. 6..
//  Copyright © 2017년 Zondug Kim. All rights reserved.
//

import Foundation
import UIKit

class CellData {
//	맵 데이터를 만들어야 한다
	
	var name: String?
	var type: String?
	var color: String?
	var desc: String?
	
	init() {
		
	}
	
	init(name: String, type: String, color: String, desc: String) {
		self.name = name
		self.type = type
		self.color = color
		self.desc = desc
	}
	
}

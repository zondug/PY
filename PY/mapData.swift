//
//  mapData.swift
//  PY
//
//  Created by Zondug Kim on 2017. 10. 25..
//  Copyright © 2017년 Zondug Kim. All rights reserved.
//

import Foundation

class mapData {
	
	var mapsize: Int = 10
	var maptype: Int = 5 // 맵 데이터의 종류는 나중에 mapData에서 가져올 것임
	var celltype: Int = 0 // 임시로 생성해서 mapData에 넣을 값임
	
	
	func generateMap() {
		
		// 맵 데이터를 랜덤으로 만듬
		// 맵 좌표와 셀뷰 좌표를 변환하는 부분이 필요함
		
		for rows in 0...(maptype-1) {
			for cols in 0...(maptype-1) {
				
				celltype = Int(arc4random_uniform(UInt32(maptype)))
//				celltype은 celldata를 불러서 넣음
		
				mapkey = "\(rows)|\(cols)"
				
				mapArray[mapkey] = celltype
			}
		}

//		print(mapArray)
	}
	
	
}



//
//  CellsView.swift
//  PY
//
//  Created by Zondug Kim on 2017. 10. 4..
//  Copyright © 2017년 Zondug Kim. All rights reserved.
//

import Foundation
import UIKit

class CellsView: UIView {
	
	var textlabel: UILabel!
	
//	required init?(coder aDecoder: NSCoder) {
//		super.init(coder: aDecoder)
//	}
	
	func initializeCells() {
		
		self.backgroundColor = .black
		
		let noOfCells: Int = 5
		let cellsize: Int = Int(self.bounds.maxX)/(noOfCells+1)
		let spacing: Int = 5

		let centering: Int = Int(self.bounds.width)/2 - (noOfCells * cellsize + (spacing * 4))/2
		
		for rows in 0...(noOfCells-1) {
			for cols in 0...(noOfCells-1) {
				
				let back = UIView()
				back.frame = CGRect(x: centering + (rows * cellsize) + (spacing * rows), y: centering + (cols * cellsize) + (spacing * cols), width: cellsize, height: cellsize)
				let cell: UIImageView = UIImageView(frame: back.bounds)

				// 이 레이블은 이제 UIImage로 교체해야 함: celldata <- mapdata
				textlabel = UILabel(frame: cell.bounds)
				textlabel.textAlignment = .center
				textlabel.textColor = .white
//				textlabel.text = "\(rows, cols)"
				textlabel.text = "\((mapArray[key])!)"
				
				cell.addSubview(textlabel)
				
				// 셀을 그리면서 셀의 mapArray에서 데이터를 로딩하고 그걸 이미지로 바꿔서 뿌려야 함
				
				cell.layer.borderWidth = 1.5
				cell.layer.borderColor = UIColor.white.cgColor
				cell.layer.cornerRadius = 2
				cell.layer.masksToBounds = true
				
				cell.bringSubview(toFront: textlabel)
				back.addSubview(cell)
				self.addSubview(back)
				
				// 현재는 key 값을 가지고 위치를 알 수가 없게 되어 있음
				// 이메일 파싱하는 것처럼 앞과 뒤를 분리해서 가져와야 할 듯
				key = "\(rows)|\(cols)"
				cells[key] = cell

			}
		}
	}

	// key에서 x와 y를 분리해 내고, 각각을 Int로 변환해서 다시 key로 리턴한다
	func moving(to: direction) -> String {

//		to direction은 이미 변화된 ViewController에서 넘어 온 key 값임
//		방향에 해당하는 뷰를 확대하고 effect.zoom
//		pop -> reverse -> zoom
//		close view -> touch -> move
//		해당 방향의 새 값을 mapArray에서 받아 오고, cell에 뿌림

		var keyx = global.split(key: key).0 as! Int
		var keyy = global.split(key: key).1 as! Int
		
		// 방향에 따라 좌표를 바꿔야 함
		
		
		
//		enum direction: String {
//			case center = "2|2"
//			case north = "2|1"
//			case northeast = "3|1"
//			case east = "3|2"
//			case southeast = "3|3"
//			case south = "2|3"
//			case southwest = "1|3"
//			case west = "1|2"
//			case northwest = "1|1"
//		}
		
		let currentkey = "\(keyx)|\(keyy)"
		
		return currentkey
	}
}











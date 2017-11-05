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
				textlabel.text = "\(rows, cols)"
//				textlabel.text = "\((mapArray[key])!)"
				
				cell.addSubview(textlabel)
				
				cell.layer.borderWidth = 1.5
				cell.layer.borderColor = UIColor.white.cgColor
				cell.layer.cornerRadius = 2
				cell.layer.masksToBounds = true
				
				cell.bringSubview(toFront: textlabel)
				back.addSubview(cell)
				self.addSubview(back)
				
				viewkey = "\(rows)|\(cols)"
				cells[viewkey] = cell
			}
		}
	}
	
	func drawingcell() {
		
//		cell 그리는 부분을 별도 함수로 뺄 수 있나?
		
		
		
	}
}











//
//  TimerBarView.swift
//  PY
//
//  Created by Zondug Kim on 2017. 11. 5..
//  Copyright © 2017년 Zondug Kim. All rights reserved.
//

import Foundation
import UIKit

class TimerBarView: UIView {
	
	var progressbar = UIView()
	
//
//	override func draw(_ rect: CGRect) {
//		var timerbox = UIBezierPath(roundedRect: CGRect(
//			x: bounds.minX + 1,
//			y: bounds.minY + 1,
//			width: bounds.maxX/CGFloat(timecounter),
//			height: bounds.maxY),
//									cornerRadius: 1)
//		myred.set()
//		timerbox.stroke()
//		timerbox.fill()
//	}
	
	
	func timerinitialize() {
		
		progressbar.frame = self.bounds
		
		let cellsize: CGFloat = CGFloat((self.frame.maxX)/10)

		for count in 0...9 {

			let progresscell = UIView()
			progresscell.frame = CGRect(
				x: (CGFloat(count) * cellsize),
				y: self.frame.minY,
				width: cellsize,
				height: self.frame.height)
//			progresscell.backgroundColor = myred
//			progresscell.isHidden = true

			progressbar.addSubview(progresscell)
			superview!.addSubview(progressbar)
			timerbar["\(count)"] = progresscell

		}
	}
	
}

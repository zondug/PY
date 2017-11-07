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
	
	override func draw(_ rect: CGRect) {
		
		let timerprogress = UIBezierPath(rect: CGRect(x: frame.minX, y: frame.minY,
													  width: (CGFloat(timecounter) * 0.1) * frame.width,
													  height: frame.height))
		myred.setFill()
		timerprogress.fill()
		
		setNeedsDisplay()
	}
}

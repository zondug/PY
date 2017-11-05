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
	
	private var _innerTurnTimer: Int = 0
	
	var progress: Int {
		
		set (newTurnTimer) {
			if newTurnTimer > 1 {
				_innerTurnTimer = 1
			} else if newTurnTimer < 0 {
				_innerTurnTimer = 0
			} else {
				_innerTurnTimer = newTurnTimer
			}
			setNeedsDisplay()
		}
		get {
			return _innerTurnTimer * timecounter
		}
	}
	override func draw(_ rect: CGRect) {
		TurnTimerBarDraw.drawTurnTimerBar(frame: bounds, progress: timecounter)
	}
}

public class TurnTimerBarDraw: NSObject {
	
	public class func drawTurnTimerBar(frame: CGRect = CGRect(x: 0, y: 0, width: 300, height: 16), progress: Int = 0) {

		let color = myred
		
		let timerBorderPath = UIBezierPath(roundedRect: CGRect(x: frame.minX + 1, y: frame.minY + 1, width: floor((frame.width - 1) * 0.99666 + 0.5), height: 14), cornerRadius: 7)
		color.setStroke()
		timerBorderPath.lineWidth = 1
		timerBorderPath.stroke()
		
		let timerActivePath = UIBezierPath(roundedRect: CGRect(x: 1, y: 1, width: timecounter, height: 14), cornerRadius: 7)
		color.setFill()
		timerActivePath.fill()
	}
}

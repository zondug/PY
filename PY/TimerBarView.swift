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
	
//	let progressbar = UIView()

	func timerinitialize() {
		
		
		let cellsize: CGFloat = CGFloat((self.frame.maxX)/10)

		for count in 0...9 {
			
			let progresscell = UIView()
			progresscell.frame = CGRect(x: (CGFloat(count) * cellsize), y: self.frame.minY, width: cellsize, height: self.frame.height)
			progresscell.backgroundColor = myred
			progresscell.isHidden = true
			
			superview?.addSubview(progresscell)
			timerbar["\(count)"] = progresscell
			
		}
	}
	
}

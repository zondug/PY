//
//  CellsVewEffects.swift
//  PY
//
//  Created by Zondug Kim on 2017. 10. 5..
//  Copyright © 2017년 Zondug Kim. All rights reserved.
//

import UIKit

class CellsVewEffects: UIView {
	
	func zoom(key: String) {
		
		targetcell = cells[key]
		
		UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
			targetcell?.layer.transform = CATransform3DMakeScale(1.1, 1.1, 1.1)
		}, completion: nil)
		targetcell?.backgroundColor = .yellow
	}
	
	func normalize(key: String) {
		
		targetcell = cells[key]
		
		UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
			targetcell?.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
		}, completion: nil)
		
		targetcell?.backgroundColor = .black
		
	}
	
	func reverse(key: String) {
		
		targetcell = cells[key]
		
		// frontCell은 카드를 뒤집을 때 나오는 화면임 -> 확대 -> 터치(사라짐) -> 셀 뷰 삭제 -> 이동
		let frontCell = UIImageView()
		
		frontCell.frame = (targetcell?.bounds)!
		
		frontCell.backgroundColor = .gray
		frontCell.layer.borderWidth = 1.5
		frontCell.layer.borderColor = UIColor.gray.cgColor
		frontCell.layer.cornerRadius = 2
		frontCell.layer.masksToBounds = true
		
		
		UIView.transition(from: targetcell!, to: frontCell, duration: 0.3, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
		
	}

}

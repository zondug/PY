//
//  CellsVewEffects.swift
//  PY
//
//  Created by Zondug Kim on 2017. 10. 5..
//  Copyright © 2017년 Zondug Kim. All rights reserved.
//

import UIKit
import QuartzCore

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
		
		UIView.transition(from: targetcell!, to: frontCell, duration: 0.2, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
		
		frontCell.backgroundColor = .red
		cells[key] = frontCell
		
//		effect.glow(key: key)
		
	}
	
	func glow(key: String) {
		
		targetcell = cells[key]

//		targetcell?.layer.backgroundColor = UIColor.magenta.cgColor
		
		let animation = CAKeyframeAnimation(keyPath: "transform.scale")
		
		for i in 0...10 {
			
		}
	
	}
	
	func pop(key: String) {
		
		targetcell = cells[key]
		
		// This part is from a book 'IOS Swift Game Development Cookbook' of O'Reilly Media, p60
		
		let keyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
		keyframeAnimation.keyTimes = [0.0, 0.7, 1.0] // Each number in the keyTimes array indicates at which point the corresponding value in the values array will be reached. Each key time is given as a value from 0 to 1, with 0 being the start of the animation and 1 being the end.
		keyframeAnimation.values = [0.0, 1.2, 1.0] // In this animation, there are three values: 0, 1.2, and 1.0. These will be used as the scale values: the animation will start with a scale of zero (i.e., scaled down to nothing), then expand to 1.2 times the normal size, and then shrink back down to the normal size.
		keyframeAnimation.duration = 0.4
		keyframeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)

		targetcell?.layer.add(keyframeAnimation, forKey: "pop")
	}
	
	// key(String)에서 x와 y를 분리해 내고, 각각을 Int로 변환해서 다시 key로 리턴하려고 했는데, 그냥 글로벌 x,y를 가지고 있고 그걸 합쳐서 key를 만드는게 나은듯
	func moving(direction: Direction) -> String {
		
		var newkey: String = direction.changed()
		
		//		mapArray[newkey]
		
		// 1. mapArray에 있는 주변 셀들을 전부 불러옴
		// 2. 셀뷰에 반영
		// 방향에 따라 좌표를 바꿔야 함
		
		var updatedkey = newkey
		
		return updatedkey
	}

}

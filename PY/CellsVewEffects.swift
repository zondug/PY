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
		
		UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
			cells[key]?.layer.transform = CATransform3DMakeScale(1.1, 1.1, 1.1)
		}, completion: nil)
		cells[key]?.backgroundColor = .yellow
	}
	
	func normalize(key: String) {
		
		UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
			cells[key]?.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
		}, completion: nil)
		
		cells[key]?.backgroundColor = .black
		
		// normalize를 실행한 뒤에 센터 셀(좌표를 확인한 뒤) 깜빡 
		
	}
	
	func reverse(key: String) {
		
		// frontCell은 카드를 뒤집을 때 나오는 화면임 -> 확대 -> 터치(사라짐) -> 셀 뷰 삭제 -> 이동
		let frontCell = UIImageView()

		frontCell.frame = (cells[key]?.bounds)!
		
		frontCell.backgroundColor = .gray
		frontCell.layer.borderWidth = 1.5
		frontCell.layer.borderColor = UIColor.gray.cgColor
		frontCell.layer.cornerRadius = 2
		frontCell.layer.masksToBounds = true
		
		UIView.transition(from: cells[key]!, to: frontCell, duration: 0.2, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
		
		frontCell.backgroundColor = .red
		cells[key] = frontCell
		
//		effect.glow(key: key)
		
	}
	
	func glow(key: String) {
		
		targetcell = cells[key]

//		targetcell?.layer.backgroundColor = UIColor.magenta.cgColor
		
		let animation = CAKeyframeAnimation(keyPath: "transform.scale")
	
	}
	
	func pop(key: String) {
		
		// This part is from a book 'IOS Swift Game Development Cookbook' of O'Reilly Media, p60
		
		let keyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
		keyframeAnimation.keyTimes = [0.0, 0.7, 1.0] // Each number in the keyTimes array indicates at which point the corresponding value in the values array will be reached. Each key time is given as a value from 0 to 1, with 0 being the start of the animation and 1 being the end.
		keyframeAnimation.values = [0.0, 1.2, 1.0] // In this animation, there are three values: 0, 1.2, and 1.0. These will be used as the scale values: the animation will start with a scale of zero (i.e., scaled down to nothing), then expand to 1.2 times the normal size, and then shrink back down to the normal size.
		keyframeAnimation.duration = 0.4
		keyframeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)

		cells[key]?.layer.add(keyframeAnimation, forKey: "pop")
	}
	
	func coloredpop(targetview: UIView, duration: Double) {
				
//		let keyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
//		keyframeAnimation.keyTimes = [0.0, 0.1, 0.3, 0.5]
//		keyframeAnimation.values = [0.0, 1.2, 1.0, 0.0]
//		keyframeAnimation.duration = 0.5
//		keyframeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
//		targetview.layer.isHidden = false
		targetview.backgroundColor = myred

		UIView.animate(withDuration: duration, delay: 0, options: (.curveEaseOut), animations: {
			targetview.layer.transform = CATransform3DMakeScale(1.0, 2.0, 1.0)
			targetview.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
		}, completion: nil)
	}
	
	// key(String)에서 x와 y를 분리해 내고, 각각을 Int로 변환해서 다시 key로 리턴하려고 했는데, 그냥 글로벌 x,y를 가지고 있고 그걸 합쳐서 key를 만드는게 나은듯
	func moving(direction: Direction) -> String {
		
		let newkey: String = direction.changed()
		print(newkey)
		
		
		//		mapArray[mapkey]
		
		// 1. mapArray에 있는 주변 셀들을 전부 불러옴
		// 뷰를 이동하는게 아니라 데이터가 이동하는 거임
		// 2|2 -> 2|3으로 이동을 하면, 전체 셀을 0|+1 하면 되는듯? 
		
		// 2. 셀뷰에 반영
		
		// 방향에 따라 좌표를 바꿔야 함
		// for를 써서 셀들을 다 돌아다니면서 바꿔야 되는 듯
		
		var updatedkey = newkey
		
		return updatedkey
	}

}

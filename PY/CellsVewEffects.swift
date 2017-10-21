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
		
		effect.pop(key: key)
		
	}
	
	func glow(key: String) {
		
		targetcell = cells[key]

		let tempEffectView: UIImageView = UIImageView()
		let temppositon: CGPoint = CGPoint(x: (targetcell?.frame.minX)!, y: (targetcell?.frame.minY)!)
		let tempsize: CGSize = (targetcell?.frame.size)!
		
		tempEffectView.frame = CGRect(origin: temppositon, size: tempsize)
		
		tempEffectView.backgroundColor = blueviolet
		tempEffectView.layer.borderWidth = 1.5
		tempEffectView.layer.borderColor = UIColor.gray.cgColor
		tempEffectView.layer.cornerRadius = 2
		tempEffectView.layer.masksToBounds = true
		
		// superview의 superview에 붙일 수가 있구나
		targetcell?.superview?.superview?.addSubview(tempEffectView)
		targetcell?.superview?.superview?.bringSubview(toFront: tempEffectView)
		
		
		UIImageView.animate(withDuration: 1, animations: {
			
			tempEffectView.frame.size.width += 50
			tempEffectView.frame.size.height += 50
			
		}, completion: nil)
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

}

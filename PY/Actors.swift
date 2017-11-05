//
//  Actors.swift
//  PY
//
//  Created by Zondug Kim on 2017. 10. 7..
//  Copyright © 2017년 Zondug Kim. All rights reserved.
//

import Foundation

class Actors {

	private var _hp: Int = 100;
	
	var name: String?
	var actorclass: Actorclass
	var position: String?
	var language: Language
	var attitude: Attitude
	
	var hp: Int {
		get {
			return _hp;
		}
	}
	
	init(name: String, position: String, actorclass: Actorclass, language: Language, attitude: Attitude) {
		
		self.name = name
		self.actorclass = actorclass
		self.position = position
		self.language = language
		self.attitude = attitude
		
	}
	
	
}

//class Enemy: Actors {
//
//	var weapon: Weapon
//
//	init(weapon: Weapon) {
//
//		super.init(name: "John", position: "2|2", actorclass: .officer, language: .korean, attitude: .normal)
//		self.Weapon = weapon
//
//	}
//
//}

enum Actorclass {
	case kid
	case civilian
	case shopkeeper
	case laborer // 노동자
	case soldier
	case officer // 장교
	case pettyofficial // Petty official 하급 공무원
	case official // 공무원
	case hero // 북한식 영웅
}

enum Attitude {
	case friendly
	case normal // 아무 것도 아닌 상태
	case question // 뭐지? 하고 이상한 낌새를 느낀 상태, 아주 짧은 순간임
	case suspicious // 뭔가 의심스러운 상태, 접근 시도
	case cautious // 주의하는 상태, 경계 상태
	case freeing // 겁을 먹고 도주하는 상태
	case hostile // 적대적, 적을 확신했고 공격적 상태
}

enum Language {
	case korean
	case english
}

enum Weapon {
	case barehands
	case ak47 // AK-47
	case autorifle // AR 15
	case pistol // Pistol
}

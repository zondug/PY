
import UIKit
import Foundation

// cells를 전역 변수로 만듬
var cells = [String: UIView]()
var mapArray = [String: Int]()
var celldata = CellData()
var mapdata = mapData()
var effect = CellsVewEffects()
var targetcell: UIView?
var global = GlobalFunctions()
var direction: Direction = .center


// time is 24 hours, player character is a soldier
var realtime = Date() // sample result: "Oct 7, 2017 at 5:07 PM"
let calendar = Calendar.current
let hour = calendar.component(.hour, from: realtime)
let minutes = calendar.component(.minute, from: realtime)

var currentx: Int = 2
var currenty: Int = 2

var key: String = global.combine(x: currentx, y: currenty) {
	willSet {
		// if key is changed
		if key != newValue {
			effect.normalize(key: key)
			effect.zoom(key: newValue)

		// if key is not changed, just do nothing
		} else if key == newValue {
			return
		}
	}
}

enum Direction {
	
	case center
	case north
	case northeast
	case east
	case southeast
	case south
	case southwest
	case west
	case northwest
	
	init() {
		self = .center
	}
	
	func changed() -> String {
		
		var newValue = key
		
		switch direction {
		case .north:
//			= -
			currenty -= 1
			newValue = global.combine(x: currentx, y: currenty)
		case .northeast:
//			+ -
			currentx += 1
			currenty -= 1
			newValue = global.combine(x: currentx, y: currenty)
		case .east:
//			+ =
			currentx += 1
			newValue = global.combine(x: currentx, y: currenty)
		case .southeast:
//			+ +
			currentx += 1
			currenty += 1
			newValue = global.combine(x: currentx, y: currenty)
		case .south:
//			= +
			currenty += 1
			newValue = global.combine(x: currentx, y: currenty)
		case .southwest:
//			- +
			currenty += 1
			newValue = global.combine(x: currentx, y: currenty)
		case .west:
//			- =
			currentx -= 1
			newValue = global.combine(x: currentx, y: currenty)
		case .northwest:
//			- -
			currentx -= 1
			currenty -= 1
			newValue = global.combine(x: currentx, y: currenty)
			
		default:
			newValue = global.combine(x: currentx, y: currenty)
		}
		
		print(newValue)
		return newValue
	}
	
}

enum Attitude {
	case friendly
	case hostile
}

enum Language {
	case korean
	case english
}

enum Weapon: String {
	case ak47 = "AK-47"
	case autorifle = "AR 15"
	case pistol = "Pistol"
}

	


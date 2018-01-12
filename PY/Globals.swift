
import UIKit
import Foundation

// cells를 전역 변수로 만듬
var cells = [String: UIView]()
var timerbar = [String:UIView]()
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

var timecounter: Int = 0 {
	didSet {
		
	}
}

// currentx, currenty는 mapkey임
// 초기화를 computed property로 만들어야 함
var currentx: Int {
	get {
		return global.split(key: mapkey).0
	}
}
var currenty: Int {
	get{
		return global.split(key: mapkey).1
	}
}

var mapkey: String = viewkey

var viewkey: String = "2|2" {
	willSet {
		// if key is changed
		if viewkey != newValue {
			effect.normalize(key: viewkey)
			effect.zoom(key: newValue)

		// if key is not changed, just do nothing
		} else if viewkey == newValue {
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
		
		// view의 key와 map의 key를 분리해야 함
		// view의 key는 항상 2|2를 센터로 놓고, map의 key는 좌표에 따라서 계속 이동

		switch direction {
		case .north:
//			= -
//			currenty -= 1
			mapkey = global.combine(x: currentx, y: currenty - 1)
		case .northeast:
//			+ -
//			currentx += 1
//			currenty -= 1
			mapkey = global.combine(x: currentx + 1, y: currenty - 1)
		case .east:
//			+ =
//			currentx += 1
			mapkey = global.combine(x: currentx + 1, y: currenty)
		case .southeast:
//			+ +
//			currentx += 1
//			currenty += 1
			mapkey = global.combine(x: currentx + 1, y: currenty + 1)
		case .south:
//			= +
//			currenty += 1
			mapkey = global.combine(x: currentx, y: currenty + 1)
		case .southwest:
//			- +
//			currentx -+ 1
//			currenty += 1
			mapkey = global.combine(x: currentx - 1, y: currenty + 1)
		case .west:
//			- =
//			currentx -= 1
			mapkey = global.combine(x: currentx - 1, y: currenty)
		case .northwest:
//			- -
//			currentx -= 1
//			currenty -= 1
			mapkey = global.combine(x: currentx - 1, y: currenty - 1)
			
		default:
			mapkey = global.combine(x: currentx, y: currenty)
		}
		
//		print(currentx, currenty, newValue)
		return mapkey
	}
}
	


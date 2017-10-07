
import UIKit
import Foundation

// cells를 전역 변수로 만듬
var cells = [String: UIView]()
var celldata = CellData()
var effect = CellsVewEffects()
var targetcell: UIView?

// time is 24 hours, player character is a soldier
var realtime = Date() // sample result: "Oct 7, 2017 at 5:07 PM"
let calendar = Calendar.current
let hour = calendar.component(.hour, from: realtime)
let minutes = calendar.component(.minute, from: realtime)


var key: String = direction.center.rawValue {
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

enum direction: String {
	case center = "2|2"
	case north = "2|1"
	case northeast = "3|1"
	case east = "3|2"
	case southeast = "3|3"
	case south = "2|3"
	case southwest = "1|3"
	case west = "1|2"
	case northwest = "1|1"
}

enum attitude: String {
	case friendly = "Friendly"
	case hostile = "Hostile"
}

enum language: String {
	case korean = "Korean"
	case english = "English"
}

enum weapon: String {
	case ak47 = "AK-47"
	case autorifle = "AR 15"
	case pistol = "Pistol"
}

	


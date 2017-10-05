
import UIKit
import Foundation

// cells를 전역 변수로 만듬
var cells = [String: UIView]()

var key: String = targetcell.center.rawValue {
	willSet {
		// if key is changed
		if key != newValue {
			//			effect.normalize(key: key)
			//			effect.zoom(key: newValue)
			// if key is not changed, just do nothing
		} else if key == newValue {
			return
		}
	}
}

var effect = CellsVewEffects()

enum targetcell: String {
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

//
//  GameViewController.swift
//  PY
//
//  Created by Zondug Kim on 2017. 10. 4..
//  Copyright © 2017년 Zondug Kim. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

	@IBOutlet var weatherUI: UILabel!
	@IBOutlet var distanceUI: UILabel!
	@IBOutlet var cellsView: CellsView!
	
	
	var firstLocation: CGPoint?
	var secondLocation: CGPoint?

	
    override func viewDidLoad() {
        super.viewDidLoad()
				
//		print("Game View is loaded.")
		cellsView.drawingCells()

		// ????? what is this fuckin "@objc" on func ?????
		view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.swipes(swiped:))))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

	@objc func swipes(swiped: UIPanGestureRecognizer) {
		
		let dragged = swiped.translation(in: view)
		
		var angle =  Double(atan2f(Float(dragged.y), Float(dragged.x))) * (360 / (2 * Double.pi))
		
		if (angle < 0) {
			angle = angle + 360
		}
		
		var distance: CGFloat = 0.0
		let center: CGFloat = 30.0
		let close: CGFloat = 120
//		let far: CGFloat = 180
		
		switch swiped.state {
			
		case .began:
			if view.frame.contains(swiped.location(in: view)) {

				firstLocation = swiped.location(in: view)
			
			}
				
		case .changed:
			secondLocation = swiped.location(in: view)
			
			let dx = (secondLocation?.x)! - (firstLocation?.x)!
			let dy = (secondLocation?.y)! - (firstLocation?.y)!
			distance = sqrt(dx*dx + dy*dy)
			
			//			거리에 따라 두 칸 이동 처리
			
			if distance < center {
				
				key = direction.center.rawValue
				effect.zoom(key: key)
				
			} else if center < distance && distance < close {
				
				switch angle {
				case 22.5 ..< 67.5:
					key = direction.southeast.rawValue
				case 67.5 ..< 112.5:
					key = direction.south.rawValue
				case 112.5 ..< 157.5:
					key = direction.southwest.rawValue
				case 157.5 ..< 202.5:
					key = direction.west.rawValue
				case 202.5 ..< 237.5:
					key = direction.northwest.rawValue
				case 237.5 ..< 292.5:
					key = direction.north.rawValue
				case 292.5 ..< 337.5:
					key = direction.northeast.rawValue
				case 337.5 ..< 360, 0 ..< 22.5:
					key = direction.east.rawValue
				default: break
				}
				
			}  else  {
				break
			}

			
		case .ended:
			//			print("released")
			effect.normalize(key: key)
			effect.reverse(key: key)
			return
			
		default:
			break
		}
	}
}





    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



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
		
		mapdata.generateMap()
		cellsView.initializeCells()

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
		let center: CGFloat = 25.0
		let close: CGFloat = 90
		
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
				
				direction = .center
				key = global.combine(x: currentx, y: currenty)
				effect.zoom(key: key)
				
			} else if center < distance && distance <= close {
				
				switch angle {
				case 22.5 ..< 67.5:
					direction = .southeast
					key = global.combine(x: currentx+1, y: currenty+1)
				case 67.5 ..< 112.5:
					direction = .south
					key = global.combine(x: currentx, y: currenty+1)
				case 112.5 ..< 157.5:
					direction = .southwest
					key = global.combine(x: currentx-1, y: currenty+1)
				case 157.5 ..< 202.5:
					direction = .west
					key = global.combine(x: currentx-1, y: currenty)
				case 202.5 ..< 237.5:
					direction = .northwest
					key = global.combine(x: currentx-1, y: currenty-1)
				case 237.5 ..< 292.5:
					direction = .north
					key = global.combine(x: currentx, y: currenty-1)
				case 292.5 ..< 337.5:
					direction = .northeast
					key = global.combine(x: currentx+1, y: currenty-1)
				case 337.5 ..< 360, 0 ..< 22.5:
					direction = .east
					key = global.combine(x: currentx+1, y: currenty)
				default: break
				}
				
			} else if close < distance {
				
				break
				
			} else  {
				break
			}

			
		case .ended:
			print("released on \(direction).")
			effect.normalize(key: key)
			effect.reverse(key: key)
			effect.moving(direction: direction)
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



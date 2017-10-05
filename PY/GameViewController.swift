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
	
	@IBAction func tap(_ sender: Any) {
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
				
//		print("Game View is loaded.")
		cellsView.drawingCells()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

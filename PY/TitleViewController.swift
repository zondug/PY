//
//  ViewController.swift
//  PY
//
//  Created by Zondug Kim on 2017. 10. 4..
//  Copyright © 2017년 Zondug Kim. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {

	@IBOutlet var button: UIButton!
	var introPlayed = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		

//		첫 실행이면 인트로를 실행하고 인트로 카운트를 체크
//		introPlayed = true
		
//		if introPlayed == true {
//
//			button.isHidden = false
//
//		} else {
//
//			button.isHidden = true
////			play Intro Scene
////			Skip
//			introPlayed = true
//		}
	}

	@IBAction func start(_ sender: Any) {
		performSegue(withIdentifier: "start", sender: self)
	}
	
}


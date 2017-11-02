//
//  Weather.swift
//  PY
//
//  Created by Zondug Kim on 2017. 10. 31..
//  Copyright © 2017년 Zondug Kim. All rights reserved.
//

import Foundation

var weatherchanging: Bool = false
var timer = realtime

class Weather {
	
	// 시간 또는 확률을 계산해서 날씨가 바뀔지 말지 (weatherchanging) 결정하고
	// 바뀔 때 현재 상황에 따라서 바뀔 대상을 결정 (Tree)
	// 바뀌고 나면 종료
		
	func temperature(state: Temperature) -> String {
		return state.rawValue
	}
	
	func shivering(state: Temperature) -> String {
		
		var desctext = "You are cold."

		switch state.hashValue {
		case 3 ..< 5:
			desctext = Bodystate.shiver.describe()
		case 5 ..< 10:
			desctext = Bodystate.shudder.describe()
		case 10 ..< 13:
			desctext = Bodystate.tremble.describe()
		default:
			break
		}
		return desctext
	}
	
	func changing(to: Weathers) -> Weathers {
		
		var currentWeather: Weathers = to
		
		// 현재 날씨의 경우 + 온도 
		
		
		var newWeather: Weathers = currentWeather
		
		return newWeather
	}
}

enum Bodystate: String {
	case shiver = "shivering"
	case shudder = "shuddering"
	case tremble = "trembling"
	
	func describe() -> String {
		
		print("You are" + self.rawValue + "with cold.")
		
		let describing = String("You are" + self.rawValue + "with cold.")
		
		return describing
	}
}

enum Temperature: String {
	// 이 게임의 배경에는 더운 날씨가 없다

	//	case hot
	//	case worm
//	case cool
	case cold = "cold"
	case bleak = "bleak cold"
	case frigid = "frigid"
	case gelid = "gelid"
	case biting = "biting cold"
	case bitterly = "bitterly cold"
	case frosty = "frosty cold"
	case freezing = "freezing cold"
	case absolutely = "absolutely freezing cold"
	case icy = "icy cold"
	case harsh = "harsh cold"
	case tempestuous = "tempestuous cold"
	case whizzing = "whizzing cold" // 바람이 쌩쌩 부는
	case hellfrost = "hellfrost"
	
	func actualtemp() -> String {
		let actualtemp = "-\(self.hashValue + 10)"
		print("The actual temperature is \(actualtemp) degree.")
		
		return actualtemp
	}
}

enum Weathers: String {
	// clear
	case clear = "clear"

	// cloudy
	case partlycloudy = "partly cloudy" // 구름이 끼기 시작함
	case cloudy = "cloudy" // 흐린
	case gloomy = "gloomy" // 우울하게 흐린
	case foggy = "foggy"
	case overcast = "overcast" // 잔뜩 흐린

	// rain
	case drizzle = "drizzle" // 이슬비
	case showers = "showers" // 소나기
	case rainy = "rainy"
	case downpour = "downpour" // 폭우
	case stormy = "stormy"
	//	case flood = "flood" // 홍수

	// snow
	case snowy = "snowy"
	case hailing = "hailing" // 우박
	case sleeting = "sleeting" // 진눈깨비
	case snowflake = "snowflake" // 함박눈
	case blizzard = "blizzard" // 폭설

	// wind
	//	case breeze = "breeze" // 산들바람
	case windy = "windy"
	case gusty = "gusty windy" // 세찬
	case blustery = "blustery windy" // 거센 바람
	case gale = "gale windy" // 강풍
	//	case hurricane = "hurricane" // 허리케인

	// sudden
	case lightning = "lightning"
	case thunder = "thunder"

}

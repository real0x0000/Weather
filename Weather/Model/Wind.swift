//
//  Wind.swift
//  Weather
//
//  Created by Anuwat Sittichak on 20/4/2563 BE.
//

import SwiftyJSON

struct Wind: DataModel {
    
    let speed: Double
    let deg: Int
    
    init(speed: Double, deg: Int) {
        self.speed = speed
        self.deg = deg
    }
    
    init(fromJSON json: JSON) {
        self.speed = json["speed"].doubleValue
        self.deg = json["deg"].intValue
    }
    
    static func mockData() -> Wind {
        let speed: Double = 0.0
        let deg: Int = 0
        return Wind(speed: speed, deg: deg)
    }
}

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
    
    init(fromJSON json: JSON) {
        self.speed = json["speed"].doubleValue
        self.deg = json["deg"].intValue
    }
}

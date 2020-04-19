//
//  WeatherMain.swift
//  Weather
//
//  Created by Anuwat Sittichak on 20/4/2563 BE.
//

import SwiftyJSON

struct WeatherMain: DataModel {
    
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    
    init(fromJSON json: JSON) {
        self.temp = json["temp"].doubleValue
        self.feels_like = json["feels_like"].doubleValue
        self.temp_min = json["temp_min"].doubleValue
        self.temp_max = json["temp_max"].doubleValue
        self.pressure = json["pressure"].intValue
        self.humidity = json["humidity"].intValue
    }
}

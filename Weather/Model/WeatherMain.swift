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
    
    init(temp: Double, feels_like: Double, temp_min: Double, temp_max: Double, pressure: Int, humidity: Int) {
        self.temp = temp
        self.feels_like = feels_like
        self.temp_min = temp_min
        self.temp_max = temp_max
        self.pressure = pressure
        self.humidity = humidity
    }
    
    init(fromJSON json: JSON) {
        self.temp = json["temp"].doubleValue
        self.feels_like = json["feels_like"].doubleValue
        self.temp_min = json["temp_min"].doubleValue
        self.temp_max = json["temp_max"].doubleValue
        self.pressure = json["pressure"].intValue
        self.humidity = json["humidity"].intValue
    }
    
    static func mockData() -> WeatherMain {
        let temp: Double = 0.0
        let feels_like: Double = 0.0
        let temp_min: Double = 0.0
        let temp_max: Double = 0.0
        let pressure: Int = 0
        let humidity: Int = 0
        return WeatherMain(temp: temp, feels_like: feels_like, temp_min: temp_min, temp_max: temp_max, pressure: pressure, humidity: humidity)
    }
}

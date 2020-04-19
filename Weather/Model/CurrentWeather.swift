//
//  CurrentWeather.swift
//  Weather
//
//  Created by Anuwat Sittichak on 19/4/2563 BE.
//

import SwiftyJSON

struct CurrentWeather: DataModel {
    
    let id: Int
    let weather: [Weather]
    let wind: Wind
    let name: String
    let main: WeatherMain
    let cod: Int
    
    init(fromJSON json: JSON) {
        self.id = json["id"].intValue
        self.weather = [Weather].from(jsonArray: unwrapped(json["weather"].array, with: []))
        self.wind = Wind(fromJSON: json["wind"])
        self.name = json["name"].stringValue
        self.main = WeatherMain(fromJSON: json["main"])
        self.cod = json["cod"].intValue
    }
}

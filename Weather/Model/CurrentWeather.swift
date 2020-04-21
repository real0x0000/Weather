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
    let dt_txt: String
    
    init(id: Int, weather: [Weather], wind: Wind, name: String, main: WeatherMain, cod: Int, dt_txt: String) {
        self.id = id
        self.weather = weather
        self.wind = wind
        self.name = name
        self.main = main
        self.cod = cod
        self.dt_txt = dt_txt
    }
    
    init(fromJSON json: JSON) {
        self.id = json["id"].intValue
        self.weather = [Weather].from(jsonArray: unwrapped(json["weather"].array, with: []))
        self.wind = Wind(fromJSON: json["wind"])
        self.name = json["name"].stringValue
        self.main = WeatherMain(fromJSON: json["main"])
        self.cod = json["cod"].intValue
        self.dt_txt = json["dt_txt"].stringValue
    }
    
    static func mockData() -> CurrentWeather {
        let id: Int = 0
        let weather: [Weather] = []
        let wind: Wind = Wind.mockData()
        let name: String = ""
        let weatherMain: WeatherMain = WeatherMain.mockData()
        let cod: Int = 0
        let dt_txt: String = ""
        return CurrentWeather(id: id, weather: weather, wind: wind, name: name, main: weatherMain, cod: cod, dt_txt: dt_txt)
    }
}

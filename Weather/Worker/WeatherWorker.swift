//
//  WeatherWorker.swift
//  Weather
//
//  Created by Anuwat Sittichak on 19/4/2563 BE.
//

import Foundation

class WeatherWorker {
    
    var store: WeatherRestStoreProtocol
    
    init(store: WeatherRestStoreProtocol) {
        self.store = store
    }
    
    func getCurrentWeather(data: GetWeatherRequestData, completion: @escaping (Result<CurrentWeather>) -> Void) {
        store.getCurrentWeather(data: data, completion: completion)
    }
    
    func getForecast(data: GetForecastRequestData, completion: @escaping (Result<[CurrentWeather]>) -> Void) {
        store.getForecast(data: data, completion: completion)
    }
}

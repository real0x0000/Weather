//
//  WeatherRestStore.swift
//  Weather
//
//  Created by Anuwat Sittichak on 19/4/2563 BE.
//

import Foundation

protocol WeatherRestStoreProtocol {
    func getCurrentWeather(data: GetWeatherRequestData, completion: @escaping (Result<CurrentWeather>) -> Void)
}

final class WeatherRestStore: WeatherRestStoreProtocol {

    func getCurrentWeather(data: GetWeatherRequestData, completion: @escaping (Result<CurrentWeather>) -> Void) {
        APIClient.share.performRequest(route: .getWeather(data: data), onCompletion: { (json) in
            let weather = CurrentWeather(fromJSON: json)
            completion(.success(result: weather))
        }, onError: { (error) in
            completion(.failure(error: error))
        })
    }
}

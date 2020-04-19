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
    
//    func sendOTP(mobile: String, completion: @escaping (Result<String>) -> Void) {
//        store.sendOTP(mobile: mobile, completion: completion)
//    }
}

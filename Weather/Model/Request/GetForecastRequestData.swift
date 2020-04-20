//
//  GetForecastRequestData.swift
//  Weather
//
//  Created by Anuwat Sittichak on 20/4/2563 BE.
//

import Foundation

struct GetForecastRequestData {
    
    let q: String

    init(q: String) {
        self.q = q
    }
}

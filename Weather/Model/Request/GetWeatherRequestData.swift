//
//  GetWeatherRequestData.swift
//  Weather
//
//  Created by Anuwat Sittichak on 19/4/2563 BE.
//

import Foundation

struct GetWeatherRequestData {
    
    let q: String
    let degree: Degree
    
    init(q: String, degree: Degree) {
        self.q = q
        self.degree = degree
    }
}

//
//  GetForecastRequestData.swift
//  Weather
//
//  Created by Anuwat Sittichak on 20/4/2563 BE.
//

import Foundation

struct GetForecastRequestData {
    
    let q: String
    let degree: Degree

    init(q: String, degree: Degree) {
        self.q = q
        self.degree = degree
    }
}

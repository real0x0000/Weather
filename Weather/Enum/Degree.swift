//
//  Degree.swift
//  Weather
//
//  Created by Anuwat Sittichak on 21/4/2563 BE.
//

import Foundation

enum Degree {
    case celsius
    case fahrenheit
    
    func toParameters() -> String {
        switch self {
        case .celsius:
            return "metric"
        case .fahrenheit:
            return "imperial"
        }
    }
}

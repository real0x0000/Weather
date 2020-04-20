//
//  DateFormatter_Extension.swift
//  Weather
//
//  Created by Anuwat Sittichak on 21/4/2563 BE.
//

import Foundation

extension DateFormatter {
    
    static func dateFrom(string: String, format: String) -> Date? {
        let dateformat = DateFormatter()
        dateformat.locale = Locale(identifier: "en_US")
        dateformat.dateFormat = format
        return dateformat.date(from: string)
    }
    
    static func stringFrom(date: Date, format: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.locale = Locale(identifier: "en_US")
        dateFormat.dateFormat = format
        return dateFormat.string(from: date)
    }
}

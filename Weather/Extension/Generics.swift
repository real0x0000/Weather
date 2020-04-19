//
//  Generics.swift
//  Weather
//
//  Created by Anuwat Sittichak on 18/4/2563 BE.
//

import Foundation

public func unwrapped<T>(_ wrapped: T?, with castValue: T) -> T {
    if let unwrapped = wrapped {
        return unwrapped
    }
    else{
        return castValue
    }
}

public func ternary<T>(condition: Bool, true t: T, false f: T) -> T {
    if condition {
        return t
    } else {
        return f
    }
}

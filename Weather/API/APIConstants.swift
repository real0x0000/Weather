//
//  APIConstants.swift
//  Weather
//
//  Created by Anuwat Sittichak on 19/4/2563 BE.
//

import Foundation
import SwiftyJSON

struct K {
    
    struct ServerPath {
        static let baseURL = "https://api.openweathermap.org/data/2.5"
    }
    
    struct APIParameterKey {
        static let q = "q"
        static let appid = "appid"
        static let units = "units"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case acceptLanguage = "Accept-Language"
}

enum ContentType: String {
    case json = "application/json"
}

public enum Result<T> {
    case success(result: T)
    case failure(error: UserError)
}

public enum UserResult<T> {
    case success(result: T)
    case failure(userError: UserError)
    case loading
}

public struct UserError: Error {
    public let message: String
    public let json: JSON?
    
    public init(message: String, json: JSON? = nil) {
        self.message = message
        self.json = json
    }
}

public enum Content<T> {
    case loading
    case empty
    case error
    case userError(UserError)
    case success(data: T)
}

extension UserError {
    
    public static func generic() -> UserError {
        return UserError(message: Message.GENERAL_ERROR.rawValue)
    }
    
    public static func invalidJSON() -> UserError {
        return UserError(message: Message.INVALID_JSON.rawValue)
    }
}

enum Message : String {
    case GENERAL_ERROR = "Oops! something went wrong. Please try again."
    case INVALID_JSON = "😢 JSON Invalid"
    case CAN_NOT_LOAD_URL = "Can not load url. Please try again."
}

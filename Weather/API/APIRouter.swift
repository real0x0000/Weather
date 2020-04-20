//
//  APIRouter.swift
//  Weather
//
//  Created by Anuwat Sittichak on 19/4/2563 BE.
//

import Alamofire

enum APIRouter: URLRequestConvertible {

    case getWeather(data: GetWeatherRequestData)
    case getForecast(data: GetForecastRequestData)
    case rawURL(path: String, method: HTTPMethod, parameters: Parameters?)
    
    private var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getWeather:
            return "/weather"
        case .getForecast:
            return "/forecast"
        case .rawURL(let path, _, _):
            return path
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        var params: [String: Any] = [:]
        switch self {
        case .getWeather(let data):
            params[K.APIParameterKey.q] = data.q
            params[K.APIParameterKey.units] = "metric"
        case .getForecast(let data):
            params[K.APIParameterKey.q] = data.q
            params[K.APIParameterKey.units] = "metric"
        case .rawURL(_, _, let parameters):
            return parameters
        }
        params[K.APIParameterKey.appid] = "30238c587d3519ffe136dcf0f1a45655"
        return params
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var urlRequest : URLRequest
        switch self {
        case .rawURL(let path, _, _):
            urlRequest = URLRequest(url: try path.asURL())
        default:
            var url = try (K.ServerPath.baseURL).asURL()
            url.appendPathComponent(path)
            if let parameters = parameters, method == .get,
                let newURL = url.appendParameters(params: parameters) {
                url = newURL
            }
            urlRequest = URLRequest(url: url)
        }
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters, method != .get {
            do {
                #if DEBUG
                print(parameters)
                #endif
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}

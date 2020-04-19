//
//  URL_Extension.swift
//  Weather
//
//  Created by Anuwat Sittichak on 19/4/2563 BE.
//

import Alamofire

extension URL {
    
    func appendParameters( params: Parameters) -> URL? {
        var components = URLComponents(string: self.absoluteString)
        components?.queryItems = params.map { element in URLQueryItem(name: element.key, value: element.value as? String) }
        return components?.url
    }
}

//
//  Array_Extension.swift
//  Weather
//
//  Created by Anuwat Sittichak on 20/4/2563 BE.
//

import SwiftyJSON

extension Array where Element: DataModel {
    
    static func from(jsonArray: [JSON]) -> [Element] {
        var models: [Element] = []
        for json in jsonArray {
            let model = Element(fromJSON: json)
            models.append(model)
        }
        return models
    }
    
    func toJSONArray() -> [JSON]? {
        var jsonArray: [JSON] = []
        for json in self {
            if let json = json.toJSON() {
                jsonArray.append(json)
            } else {
                return nil
            }
        }
        return jsonArray
    }
}

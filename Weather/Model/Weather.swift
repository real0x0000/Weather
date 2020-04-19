//
//  Weather.swift
//  Weather
//
//  Created by Anuwat Sittichak on 19/4/2563 BE.
//

import SwiftyJSON

struct Weather: DataModel {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
    
    init(fromJSON json: JSON) {
        self.id = json["id"].intValue
        self.main = json["main"].stringValue
        self.description = json["description"].stringValue
        self.icon = json["icon"].stringValue
    }
}



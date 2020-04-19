//
//  DataModel.swift
//  Weather
//
//  Created by Anuwat Sittichak on 19/4/2563 BE.
//

import SwiftyJSON

protocol DataModel {
    init(fromJSON json: JSON)
}

extension DataModel {
    
    func toJSON() -> JSON? {
        return nil
    }
}

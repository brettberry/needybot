//
//  Entity.swift
//  speechTest
//
//  Created by Brett Berry on 8/21/16.
//  Copyright © 2016 Brett Berry. All rights reserved.
//

import SwiftyJSON

struct Entity: JSONDecodable {
    
    let entity: String
    let type: String
    let startIndex: Int
    let endIndex: Int
    let resolution: Resolution

    static func decode(json: JSON) -> Entity? {
        
        guard
            let entity = json["entity"].string,
            let type = json["type"].string,
            let startIndex = json["startIndex"].int,
            let endIndex = json["endIndex"].int,
            let resolution = Resolution.decode(json["resolution"])
        else {
            return nil
        }
        return Entity(entity: entity, type: type, startIndex: startIndex, endIndex: endIndex, resolution: resolution)
    }
}





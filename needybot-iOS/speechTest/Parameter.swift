//
//  Parameter.swift
//  speechTest
//
//  Created by Brett Berry on 8/21/16.
//  Copyright © 2016 Brett Berry. All rights reserved.
//

import SwiftyJSON

struct Parameter: JSONDecodable {
    
    let name: String
    let required: Bool
    let value: String?
    
    static func decode(json: JSON) -> Parameter? {
        
        guard
            let name = json["name"].string,
            let required = json["required"].bool
            else {
                return nil
        }
        
        let value = json["value"].string
        
        return Parameter(name: name, required: required, value: value)
    }
}

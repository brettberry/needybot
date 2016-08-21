//
//  Resolution.swift
//  speechTest
//
//  Created by Brett Berry on 8/21/16.
//  Copyright © 2016 Brett Berry. All rights reserved.
//

import SwiftyJSON

enum Resolution: JSONDecodable {
    
    case Time(String)
    case Date(String)
    
    static func decode(json: JSON) -> Resolution? {
        if let time = json["time"].string {
            return Resolution.Time(time)
        }
        if let date = json["date"].string {
            return Resolution.Date(date)
        }
        return nil
    }
    
}
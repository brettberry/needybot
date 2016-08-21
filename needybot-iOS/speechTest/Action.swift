//
//  Action.swift
//  speechTest
//
//  Created by Brett Berry on 8/21/16.
//  Copyright © 2016 Brett Berry. All rights reserved.
//

import SwiftyJSON

struct Action: JSONDecodable {
    
    let triggered: Bool
    let name: String
    let parameters: [Parameter]
    
    static func decode(json: JSON) -> Action? {
        
        guard
            let triggered = json["triggered"].bool,
            let name = json["name"].string,
            let parameters = Array<Parameter>.decode(json["parameters"])
            else {
                return nil
        }
        
        return Action(triggered: triggered, name: name, parameters: parameters)
    }
}

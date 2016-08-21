//
//  Intent.swift
//  speechTest
//
//  Created by Brett Berry on 8/21/16.
//  Copyright © 2016 Brett Berry. All rights reserved.
//

import SwiftyJSON

struct Intent: JSONDecodable {

    let intent: String
    let score: Double
    let actions: [Action]?
    
    static func decode(json: JSON) -> Intent? {
        
        guard
            let intent = json["intent"].string,
            let score = json["score"].double
        else {
            return nil
        }
        
        let actions = Array<Action>.decode(json["actions"])
        
        return Intent(intent: intent, score: score, actions: actions)
    }
}





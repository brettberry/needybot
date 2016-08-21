//
//  IntentQueryResult.swift
//  speechTest
//
//  Created by Brett Berry on 8/21/16.
//  Copyright © 2016 Brett Berry. All rights reserved.
//

import SwiftyJSON

struct IntentQueryResult: JSONDecodable {

    let query: String
    let intents: [Intent]
    let entities: [Entity]
    
    static func decode(json: JSON) -> IntentQueryResult? {
        guard
            let query = json["query"].string,
            let intents = Array<Intent>.decode(json["intents"]),
            let entities = Array<Entity>.decode(json["entities"])
        else {
            return nil
        }
        return IntentQueryResult(query: query, intents: intents, entities: entities)
    }
}

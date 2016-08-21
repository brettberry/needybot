//
//  JSONDecodable.swift
//  speechTest
//
//  Created by Brett Berry on 8/21/16.
//  Copyright © 2016 Brett Berry. All rights reserved.
//

import SwiftyJSON

protocol JSONDecodable {
    static func decode(json: JSON) -> Self?
}


// if you have an SequenceType<T> (like an array) and T is decodable, make SequenceType<T> decodable
extension SequenceType where Generator.Element: JSONDecodable {
    
    static func decode(json: JSON) -> [Generator.Element]? {
        guard let array = json.array else {
            return nil
        }
        var ret = Array<Generator.Element>()
        for element in array {
            guard let element = Generator.Element.decode(element) else {
                return nil
            }
            ret.append(element)
        }
        return ret
    }
}
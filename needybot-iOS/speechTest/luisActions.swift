//
//  luisActions.swift
//  speechTest
//
//  Created by Brett Berry on 8/20/16.
//  Copyright © 2016 Brett Berry. All rights reserved.
//

import SwiftyJSON

//func receiveIntentBody(body: String) {
//    
//    let intentJSON = JSON(body)
//    
//    guard let result = IntentQueryResult.decode(intentJSON) else {
//        print("Failed to decode IntentQueryResult")
//        return
//    }
//    print(result)
//}

func receiveIntentData(data: NSData) {
    
    let intentJSON = JSON(data: data)
    
    guard let result = IntentQueryResult.decode(intentJSON) else {
        print("Failed to decode IntentQueryResult")
        return
    }
    print(result)
}
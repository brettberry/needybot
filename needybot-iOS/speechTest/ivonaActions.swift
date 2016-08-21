//
//  actions.swift
//  speechTest
//
//  Created by Brett Berry on 8/16/16.
//  Copyright © 2016 Brett Berry. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
import SwiftyJSON
import AVFoundation

let speechParams = ["text": "hey guys, I'm a robot! I just really wanna say thank you for making me. I'm really excited to see the world!"]
let requestHeaders = ["Content-Type": "application/json"]

var player: AVAudioPlayer?

func makeRequest() {

    var finalURL: NSURL?
    
    Alamofire.download(.POST, "http://localhost:3000/speech", parameters: speechParams, encoding: .JSON, headers: requestHeaders) { tempURL, response in
        let fileManager = NSFileManager.defaultManager()
        let directoryURL = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let pathComponent = response.suggestedFilename
        finalURL = directoryURL.URLByAppendingPathComponent(pathComponent!)
        if fileManager.fileExistsAtPath(finalURL!.relativePath!) {
            do {
                try fileManager.removeItemAtPath(finalURL!.relativePath!)
            } catch let error {
                fatalError("\(error)")
            }
        }
        return finalURL!
    }
    .response { _, _, _, error in
        if let error = error {
            print(error)
            fatalError("Failed to download")
        }
            
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOfURL: finalURL!)
            let played = player!.play()
            print(played)
        } catch let error {
            print(error)
        }
    }
}







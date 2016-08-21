//
//  ViewController.swift
//  speechTest
//
//  Created by Brett Berry on 8/16/16.
//  Copyright © 2016 Brett Berry. All rights reserved.
//

import UIKit


class ViewController: UIViewController, SpeechRecognitionProtocol {
    
    @IBOutlet weak var recordingButton: UIButton!

    let language = "en-us"
    let mode = SpeechRecognitionMode.ShortPhrase
    
    var microphoneClient: MicrophoneRecognitionClient!

    override func viewDidLoad() {
        super.viewDidLoad()
//        makeRequest()
        
//        microphoneClient = SpeechRecognitionServiceFactory.createMicrophoneClientWithIntent(language,
//                                                                         withPrimaryKey: microsoftPrimaryKey,
//                                                                         withSecondaryKey: microsoftSecondaryKey,
//                                                                         withLUISAppID: luisAppID,
//                                                                         withLUISSecret: luisSecret,
//                                                                         withProtocol: self)
        
        let path = NSBundle.mainBundle().pathForResource("test", ofType: "json")!
        let fileData = try! NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
        receiveIntentData(fileData)
//        receiveIntentBody(fileContents!)
        
//        let fileContents = try! String(contentsOfFile: path)
//        receiveIntentBody(fileContents)
    }
    
    @IBAction func record(sender: AnyObject) {
//        let status = microphoneClient.startMicAndRecognition()
//        if status > 0 {
//            print(status)
//        }
    }

    func onPartialResponseReceived(partialResult: String!) {
        print(partialResult)
    }
    
    func onFinalResponseReceived(result: RecognitionResult!) {
        print(result)
    }
    
    func onError(errorMessage: String!, withErrorCode errorCode: Int32) {
        print(errorMessage)
    }
    
    func onMicrophoneStatus(recording: Bool) {
        print(recording)
    }
    
    func onIntentReceived(intent: IntentResult!) {
//        receiveIntentBody(intent.Body)
    }

}

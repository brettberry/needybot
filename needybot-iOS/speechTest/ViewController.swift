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
    let path = NSBundle.mainBundle().pathForResource("settings", ofType: "plist")
    
    var microphoneClient: MicrophoneRecognitionClient!

    override func viewDidLoad() {
        super.viewDidLoad()
//        makeRequest()
        
        microphoneClient = SpeechRecognitionServiceFactory.createMicrophoneClient(mode,
                                                                                  withLanguage: language,
                                                                                  withPrimaryKey: microsoftPrimaryKey,
                                                                                  withSecondaryKey: microsoftSecondaryKey,
                                                                                  withProtocol: self)
    }
    
    @IBAction func record(sender: AnyObject) {
        let status = microphoneClient.startMicAndRecognition()
        if status > 0 {
            print(status)
        }
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

}

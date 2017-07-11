//
//  ViewController.swift
//  MyRec
//
//  Created by 若狭　健太 on 2017/07/11.
//  Copyright © 2017年 wakasa. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let fileManager = FileManager()
    var audioRecorder: AVAudioRecorder?
    var audioPlayer: AVAudioPlayer?
    let fileName = "sample.caf"
     //documentディレクトリのURLを取得
    let documentDirFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //　再生録音の初期化関数を呼び出す
        self.setupAudioRecorder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //　録音のための初期設定
    func setupAudioRecorder(){
        //　再生と録音機能をアクティブにする
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try! session.setActive(true)
        let recordSetting : [String : AnyObject] = [
            AVEncoderAudioQualityKey : AVAudioQuality.min.rawValue as AnyObject,
            AVEncoderBitRateKey : 16 as AnyObject,
            AVNumberOfChannelsKey : 2 as AnyObject,
            AVSampleRateKey: 44100.0 as AnyObject
        ]
        do {
            try audioRecorder = AVAudioRecorder(url: documentDirFileURL as URL, settings: recordSetting)
        } catch {
            print("再生時にerror")
        }
        audioPlayer?.play()
    }
    


}


//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        sender.layer.opacity = 0.5
        
        playSound(soundType: sender.titleLabel?.text ?? "C")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            sender.layer.opacity = 1
        })
    }
    
    func playSound(soundType: String) {
        let url = Bundle.main.url(forResource: soundType, withExtension: "wav")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
}


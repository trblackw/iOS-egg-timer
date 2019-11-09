//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var timerLabel: UIStackView!
    var secondsRemaining = 60
    var timer = Timer()
    let eggTimes: [String : Int] = [
        "Soft" : 3,
        "Medium" : 4,
        "Hard" : 7
    ]
    
   

    @IBAction func hardnessSelected(_ sender: UIButton) {


        progressBar.setProgress(0.5, animated: true)
        timer.invalidate()

        doneLabel.isHidden = true
        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

       
    }
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("Seconds remaining \(secondsRemaining)")
            secondsRemaining -= 1
//            self.timerLabel.text = "\(secondsRemaining)"
        } else {
            timer.invalidate()
            doneLabel.isHidden = false
        }
    }
    
}

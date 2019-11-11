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
    var totalTime: Int = 0
    var secondsPassed: Int = 0
    var timer = Timer()
    let eggTimes: [String : Int] = [
        "Soft" : 3,
        "Medium" : 4,
        "Hard" : 7
    ]
    
   

    @IBAction func hardnessSelected(_ sender: UIButton) {


//        progressBar.setProgress(0.5, animated: true)
        progressBar.progress = 0
        timer.invalidate()
        doneLabel.isHidden = true
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

       
    }
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            let percentageProgress = secondsPassed / totalTime
            print(totalTime)
            progressBar.progress = Float(percentageProgress)
            secondsPassed += 1

        } else {
            timer.invalidate()
            doneLabel.isHidden = false
        }
    }
    
}

//
//  ViewController.swift
//  Pomodoro
//
//  Created by Thiago Borges on 7/15/15.
//  Copyright (c) 2015 Thiago Borges. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var timerSlider: UISlider!
    var scheduler: NSTimer?
    var remainingSeconds: Int = 5

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func updateCounterTime(sender: UISlider) {
        updateTimer(sender.value)
    }

    @IBAction func startPomodoro(sender: AnyObject) {
        counterLabel.text = "\(remainingSeconds) segundos"

        scheduler = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "decreaseTime", userInfo: nil, repeats: true)
        println("iniciando pomodoro")
    }
    
    func decreaseTime() {
        updateTimer(remainingSeconds - 1)

        if remainingSeconds <= 0 {
            scheduler?.invalidate()
            updateTimer(timerSlider.value)
        }
    }

    func updateTimer(time: NSNumber) {
        remainingSeconds = Int(time)
        counterLabel.text = "\(remainingSeconds) segundos"
        timerSlider.value = Float(remainingSeconds)
    }
}
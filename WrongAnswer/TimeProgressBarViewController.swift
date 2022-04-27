//
//  TimeProgressBarViewController.swift
//  WrongAnswer
//
//  Created by Smit Panchani on 17/03/22.
//

import UIKit

class TimeProgressBarViewController: UIViewController {

    @IBOutlet var timeProgressBar: UIProgressView!
    
    var timer = Timer()
    var seconds : Float = 0.0
    var timeIntervals : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTimer()
        
        
    }
    private func setTimer() {
        seconds = 0
        timeIntervals = 0.03
        timer = Timer.scheduledTimer(timeInterval: timeIntervals, target: self, selector: (#selector(updaeTimer)), userInfo: nil, repeats: true)
    }
    @objc func updaeTimer() {
        if seconds < 3 {
            seconds = seconds + Float(timeIntervals)
            timeProgressBar.progress = (seconds)/Float((timeIntervals*100))
        } else {
            timer.invalidate()
            print("Game Over")
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController: ViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            
            navigationController?.pushViewController(viewController, animated: true)
            
        }
        
    }
    
}

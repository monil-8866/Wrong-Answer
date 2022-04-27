//
//  PlayViewController.swift
//  WrongAnswer
//
//  Created by rnw on 16/03/22.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var timerProgressView: UIProgressView!
    @IBOutlet weak var gameOverAlertView: UIView!
    @IBOutlet weak var alertScoreLabel: UILabel!
    var strMode:String = "Easy"

    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestion()
        setTimer()
        setAlert()
    }
    
    private func setAlert() {
        gameOverAlertView.isHidden = true
        score = 0
    }
    
    private func showAlert() {
        gameOverAlertView.isHidden = false
    }
    
    //MARK: - VARIABLES
    var timer = Timer()
    var seconds:Float = 0.0
    var timeIntervals:Double = 0.0
    var score: Int = 0
    var rendomeOprator: Int = 0
    var arrNumbers: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    var randomeIndex: Int = 0
    var randomNo: Int = 0
    var answer: Int = 0
    var randomeTrueFalse: Int = 0
    var realAnswer: Int = 0
    
    //MARK: - SET TIMER
    private func setTimer() {
        seconds = 10
        
        if strMode == "easy" {
            seconds = 7
        } else if strMode == "medium" {
            seconds = 5
        } else if strMode == "hard" {
            seconds = 3
        }
        
        timer.invalidate()
        timeIntervals =  Double(Double(seconds)/Double(100))
        timer = Timer.scheduledTimer(timeInterval: timeIntervals, target: self, selector: (#selector(upDateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func upDateTimer() {
        if seconds > 0 {
            seconds = seconds - Float(timeIntervals)
            timerProgressView.progress = (seconds)/Float((timeIntervals*100))
        } else {
            timer.invalidate()
            showAlert()
        }
    }
    
    func setQuestion() {
        randomeIndex = Int(arc4random_uniform(UInt32(arrNumbers.count)))
        randomNo =  Int(arc4random_uniform(25))
        rendomeOprator = Int(arc4random_uniform(4))
        randomeTrueFalse = Int(arc4random_uniform(2))
        
        if randomeTrueFalse == 0 {
            if rendomeOprator == 1 {
                questionLabel.text = "\(arrNumbers[randomeIndex]) + \(randomNo) = \(arrNumbers[randomeIndex] + randomNo)"
                answer = arrNumbers[randomeIndex] + randomNo
                print(questionLabel.text!)
                print("false")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = answer
            } else if rendomeOprator == 2 {
                questionLabel.text = "\(arrNumbers[randomeIndex]) - \(randomNo) = \(arrNumbers[randomeIndex] - randomNo)"
                answer = arrNumbers[randomeIndex] - randomNo
                print(questionLabel.text!)
                print("false")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = answer
            } else if rendomeOprator == 3 {
                questionLabel.text = "\(arrNumbers[randomeIndex]) * \(randomNo) = \(arrNumbers[randomeIndex] * randomNo)"
                answer = arrNumbers[randomeIndex] * randomNo
                print(questionLabel.text!)
                print("false")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = answer
            } else {
                questionLabel.text = "\(arrNumbers[randomeIndex]) / \(randomNo) = \(arrNumbers[randomeIndex] /  randomNo)"
                answer = arrNumbers[randomeIndex] / randomNo
                print(questionLabel.text!)
                print("false")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = answer
            }
        } else {
            if rendomeOprator == 1 {
                questionLabel.text = "\(arrNumbers[randomeIndex]) + \(randomNo) = \(arrNumbers[randomeIndex] * randomNo)"
                answer = arrNumbers[randomeIndex] * randomNo
                print(questionLabel.text!)
                print("true")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = arrNumbers[randomeIndex] + randomNo
            } else if rendomeOprator == 2 {
                questionLabel.text = "\(arrNumbers[randomeIndex]) - \(randomNo) = \(arrNumbers[randomeIndex] + randomNo)"
                answer = arrNumbers[randomeIndex] + randomNo
                print(questionLabel.text!)
                print("true")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = arrNumbers[randomeIndex] - randomNo
            } else if rendomeOprator == 3 {
                questionLabel.text = "\(arrNumbers[randomeIndex]) * \(randomNo) = \(arrNumbers[randomeIndex] - randomNo)"
                answer = arrNumbers[randomeIndex] - randomNo
                print(questionLabel.text!)
                print("true")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = arrNumbers[randomeIndex] * randomNo
            } else {
                questionLabel.text = "\(arrNumbers[randomeIndex]) / \(randomNo) = \(arrNumbers[randomeIndex] + randomNo)"
                answer = arrNumbers[randomeIndex] + randomNo
                print(questionLabel.text!)
                print("true")
                rendomeOprator = Int(arc4random_uniform(4))
                realAnswer = arrNumbers[randomeIndex] / randomNo
            }
        }
    }
        
    @IBAction func trueButtonClick(_ sender: UIButton) {
        if realAnswer == answer {
            print("Wrong Answer")
            score = 0
            showAlert()
        } else {
            setQuestion()
            score = score + 1
            scoreLabel.text = String(score)
            alertScoreLabel.text = "Score : \(score)"
            setTimer()
        }
        setTimer()
    }
    
    @IBAction func falseButtonClick(_ sender: Any) {
        if realAnswer == answer {
            setQuestion()
            score = score + 1
            scoreLabel.text = String(score)
            alertScoreLabel.text = "Score : \(score)"
            setTimer()
        } else {
            print("Wrong Answer")
            score = 0
            showAlert()
        }
    }
    
    @IBAction func homeButtonClick(_ sender: UIButton) {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.pushViewController(home, animated: true)
        setAlert()
    }
    
    @IBAction func restartButtonClick(_ sender: UIButton) {
        setQuestion()
        score = 0
        scoreLabel.text = String(score)
        alertScoreLabel.text = "Score : \(score)"
        setAlert()
        setTimer()
    }
    
    @IBAction func shareButtonClick(_ sender: UIButton) {
        let selectModeViewController = self.storyboard?.instantiateViewController(withIdentifier: "SelectModeViewController") as! SelectModeViewController
        navigationController?.pushViewController(selectModeViewController, animated: true)
        setAlert()
    }
    
}

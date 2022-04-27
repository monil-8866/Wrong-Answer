//
//  ViewController.swift
//  WrongAnswer
//
//  Created by rnw on 14/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rulesView: UIView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad();        setUp(button:startButton)
        setUp(button:playButton)

    }

    @IBAction func startButton(_ sender: Any) {
        rulesView.isHidden = false
    }
    
    func setUp(button:UIButton) {
        rulesView.isHidden = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        rulesView.isHidden = true
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func playbutton(_ sender: Any) {
        let lavel = self.storyboard?.instantiateViewController(withIdentifier: "SelectModeViewController") as! SelectModeViewController
        navigationController?.pushViewController(lavel, animated: true)
    }
    
}


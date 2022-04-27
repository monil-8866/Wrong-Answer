//
//  SelectModeViewController.swift
//  WrongAnswer
//
//  Created by rnw on 15/03/22.
//

import UIKit

class SelectModeViewController: UIViewController {
    
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        setButtons(button: easyButton)
        setButtons(button: mediumButton)
        setButtons(button: hardButton)
    }
    
    private func setButtons(button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
    }
    
    private func goTOHomeScreen() {
        let homeScreen: ViewController = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - SELECT MODE BUTTON
    @IBAction func easyButtonClick(_ sender: UIButton) {
        goTOPlayViewController(mode: "easy")
    }
    
    @IBAction func mediumButtonClick(_ sender: UIButton) {
        goTOPlayViewController(mode: "medium")
    }
    
    @IBAction func hardButtonClick(_ sender: UIButton) {
        goTOPlayViewController(mode: "hard")
    }
    
    private func goTOPlayViewController(mode: String) {
        let playViewController: PlayViewController = storyboard?.instantiateViewController(identifier: "PlayViewController") as! PlayViewController
        playViewController.strMode = mode
        navigationController?.pushViewController(playViewController,animated: true)
    }
    
}

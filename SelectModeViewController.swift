//
//  SelectModeViewController.swift
//  WrongAnswer
//
//  Created by rnw on 15/03/22.
//

import UIKit

class SelectModeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func easyButttonClick(_ sender: UIButton) {
        let lavel = self.storyboard?.instantiateViewController(withIdentifier: "PlayViewController") as! PlayViewController
        navigationController?.pushViewController(lavel, animated: true)
    }
    
    
}

//
//  ViewController.swift
//  GameApp
//
//  Created by Max Franz Immelmann on 11/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var randomNumberLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        randomNumberLabel.text = getRandomNumber().formatted()
    }
    
    private func getRandomNumber() -> Int {
        Bag.shared.getRandomNumber()
    }
}

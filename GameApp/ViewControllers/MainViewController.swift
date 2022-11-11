//
//  ViewController.swift
//  GameApp
//
//  Created by Max Franz Immelmann on 11/11/22.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - @IBOutlets
    @IBOutlet var randomNumberLabel: UILabel!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        randomNumberLabel.textColor = .blue
        randomNumberLabel.font = .boldSystemFont(ofSize: 30)

        yesButton.layer.cornerRadius = 10
        noButton.layer.cornerRadius = 10
        
        randomNumberLabel.text = getRandomNumber().formatted()
    }
    
    // MARK: - @IBActions
    @IBAction func yesButtonTapped() {
    }
    @IBAction func noButtonTapped() {
        randomNumberLabel.text = getRandomNumber().formatted()
    }
    
}

// MARK: - extension
extension MainViewController {
    
    private func getRandomNumber() -> Int {
        Bag.shared.getRandomNumber()
    }
    
}

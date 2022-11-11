//
//  ViewController.swift
//  GameApp
//
//  Created by Max Franz Immelmann on 11/11/22.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - @IBOutlets
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yesButton.layer.cornerRadius = 10
        noButton.layer.cornerRadius = 10
        
        questionLabel.text = getRandomNumber()
    }
    
    // MARK: - @IBActions
    @IBAction func yesButtonTapped() {
    }
    @IBAction func noButtonTapped() {
        questionLabel.text = getRandomNumber()
    }
    
}

// MARK: - extension
extension MainViewController {
    
    private func getRandomNumber() -> String {
        let result = Bag.shared.getNextBarrel()
        if result == "Bag is empty" {
            return result
        } else {
            return "Do you have \(result) in your card?"
        }
    }
    
}

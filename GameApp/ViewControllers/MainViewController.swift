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
        
        playGame()
        
    
        
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
        return result != "Bag is empty"
        ? "Do you have \(result) in your card?"
        : result
    }
    
    private func playGame() {
        let number = Int(questionLabel.text ?? "100")
        
        let playerOne = Player(isHumam: true)
        playerOne.checkCard(for: number ?? 100)
        
        let playerTwo = Player(isHumam: false)
        playerTwo.checkCard(for: number ?? 100)
    }
    
}

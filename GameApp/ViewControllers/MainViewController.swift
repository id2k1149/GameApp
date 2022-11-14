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
    
    @IBOutlet var playerOneNameLabel: UILabel!
    @IBOutlet var playerTwoNameLabel: UILabel!
    
    @IBOutlet var playerOneCardView: UIView!
    @IBOutlet var playerTwoCardView: UIView!
    
    @IBOutlet var player1View1Collection: [UIView]!
    @IBOutlet var player1View2Collection: [UIView]!
    @IBOutlet var player1View3Collection: [UIView]!
    
    @IBOutlet var playerOneRow1Collection: [UILabel]!
    @IBOutlet var playerOneRow2Collection: [UILabel]!
    @IBOutlet var playerOneRow3Collection: [UILabel]!
    
    @IBOutlet var player2View1Collection: [UIView]!
    @IBOutlet var player2View2Collection: [UIView]!
    @IBOutlet var player2View3Collection: [UIView]!
    
    @IBOutlet var playerTwoRow1Collection: [UILabel]!
    @IBOutlet var playerTwoRow2Collection: [UILabel]!
    @IBOutlet var playerTwoRow3Collection: [UILabel]!
    
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    
    var players: [Player] = Player.getPlayersList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = getRandomNumber()
        
        playerOneCardView.layer.borderWidth = 3
        playerOneCardView.layer.cornerRadius = 10
        
        playerTwoCardView.layer.borderWidth = 3
        playerTwoCardView.layer.cornerRadius = 10
        
        let playerOne = players[0]
        guard let playerOneName = playerOne.name else { return }
        playerOneNameLabel.text = "\(playerOneName) card:"
        drawHumanCard(for: playerOne)
        
        let playerTwo = players[1]
        guard let playerTwoName = playerTwo.name else { return }
        playerTwoNameLabel.text = "\(playerTwoName) card:"
        drawCPUCard(for: playerTwo)
        
        yesButton.layer.cornerRadius = 10
        noButton.layer.cornerRadius = 10
        
    }
    
    // MARK: - @IBActions
    @IBAction func yesButtonTapped() {
        tapButton(isYesButton: true)
        drawHumanCard(for: players[0])
    }
    
    @IBAction func noButtonTapped() {
        tapButton(isYesButton: false)
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
    
    private func drawCPUCard(for player: Player) {
        
        for index in 0..<playerTwoRow1Collection.count {
            playerTwoRow1Collection[index].text = player.card.row1[index].number
            if player.card.row1[index].isCrossed {
                player2View1Collection[index].backgroundColor = .red
            }
        }
        
        for index in 0..<playerTwoRow2Collection.count {
            playerTwoRow2Collection[index].text = player.card.row2[index].number
            if player.card.row2[index].isCrossed {
                player2View2Collection[index].backgroundColor = .red
            }
        }
        
        for index in 0..<playerTwoRow3Collection.count {
            playerTwoRow3Collection[index].text = player.card.row3[index].number
            if player.card.row3[index].isCrossed {
                player2View3Collection[index].backgroundColor = .red
            }
        }
    }
    
    private func drawHumanCard(for player: Player) {
        
        for index in 0..<playerOneRow1Collection.count {
            playerOneRow1Collection[index].text = player.card.row1[index].number
            if player.card.row1[index].isCrossed {
                player1View1Collection[index].backgroundColor = .green
            }
        }
        
        for index in 0..<playerOneRow2Collection.count {
            playerOneRow2Collection[index].text = player.card.row2[index].number
            if player.card.row2[index].isCrossed {
                player1View2Collection[index].backgroundColor = .green
            }
        }
        
        for index in 0..<playerOneRow3Collection.count {
            playerOneRow3Collection[index].text = player.card.row3[index].number
            if player.card.row3[index].isCrossed {
                player1View3Collection[index].backgroundColor = .green
            }
        }
    }
    
    private func tapButton(isYesButton: Bool) {
        let playerOne = players[0]
        let playerTwo = players[1]
    
        let questionLabelToArray = questionLabel.text?.split(separator: " ")
        
        questionLabelToArray?.forEach {
            guard let number = Int($0) else {return}
            
            if isYesButton {
                playerOne.checkCard(for: number)
            }
            
            playerTwo.checkCard(for: number)
        }
    
        drawCPUCard(for: playerTwo)
    
        if playerTwo.isWinner || playerOne.isWinner{
            showAlert(with: "Game is over", and: "We have a winner!!!")
        }
    
        questionLabel.text = getRandomNumber()
        
    }
    
    // MARK: - UIAlertController
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

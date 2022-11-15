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
    @IBOutlet var resetButton: UIButton!
    
    var players: [Player] = Player.getPlayersList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = getRandomNumber()
        
        playerOneCardView.layer.borderWidth = 3
        playerOneCardView.layer.cornerRadius = 10
        
        playerTwoCardView.layer.borderWidth = 3
        playerTwoCardView.layer.cornerRadius = 10
        
        playerOneNameLabel.text = "\(players[0].name ?? "N/A") card:"
        drawHumanCard(for: players[0])
        
        playerTwoNameLabel.text = "\(players[1].name ?? "N/A") card:"
        drawCPUCard(for: players[1])
        
        yesButton.layer.cornerRadius = 10
        noButton.layer.cornerRadius = 10
        
    }
    
    // MARK: - @IBActions
    @IBAction func yesButtonTapped() {
        tapButton(isYesButton: true)
    }
    
    @IBAction func noButtonTapped() {
        tapButton(isYesButton: false)
    }
    
    @IBAction func resetButtonTapped() {
        resetCards()
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
        
        drawRow(player: players[1],
                collectionLabel: playerTwoRow1Collection,
                collectionView: player2View1Collection,
                row: players[1].card.row1)
        
        drawRow(player: players[1],
                collectionLabel: playerTwoRow2Collection,
                collectionView: player2View2Collection,
                row: players[1].card.row2)
        
        drawRow(player: players[1],
                collectionLabel: playerTwoRow3Collection,
                collectionView: player2View3Collection,
                row: players[1].card.row3)
    }
    
    private func drawHumanCard(for player: Player) {
        
        drawRow(player: players[0],
                collectionLabel: playerOneRow1Collection,
                collectionView: player1View1Collection,
                row: players[0].card.row1)
        
        drawRow(player: players[0],
                collectionLabel: playerOneRow2Collection,
                collectionView: player1View2Collection,
                row: players[0].card.row2)
        
        drawRow(player: players[0],
                collectionLabel: playerOneRow3Collection,
                collectionView: player1View3Collection,
                row: players[0].card.row3)
        
    }
    
    private func drawRow(player: Player,
                         collectionLabel: [UILabel],
                         collectionView: [UIView],
                         row: [(number: String, isCrossed: Bool)] ) {
        
        for index in 0..<collectionLabel.count {
            collectionLabel[index].text = row[index].number
            
            if row[index].isCrossed {
                switch player.isHuman {
                case true: collectionView[index].backgroundColor = .green
                case false:  collectionView[index].backgroundColor = .red
                }
            }
            
        }
    }
    
    private func resetCards() {
        players.removeAll()
        players = Player.getPlayersList()
        
        for index in 0..<player1View1Collection.count {
            player1View1Collection[index].backgroundColor = .systemBackground
        }
        
        for index in 0..<player1View2Collection.count {
            player1View2Collection[index].backgroundColor = .systemBackground
        }
        
        for index in 0..<player1View3Collection.count {
            player1View3Collection[index].backgroundColor = .systemBackground
        }
        
        for index in 0..<player2View1Collection.count {
            player2View1Collection[index].backgroundColor = .systemBackground
        }
        
        for index in 0..<player2View2Collection.count {
            player2View2Collection[index].backgroundColor = .systemBackground
        }
        
        for index in 0..<player2View3Collection.count {
            player2View3Collection[index].backgroundColor = .systemBackground
        }
        
        drawHumanCard(for: players[0])
        drawCPUCard(for: players[1])
        
    }
    
    private func tapButton(isYesButton: Bool) {
        let playerOne = players[0]
        let playerTwo = players[1]
    
        let questionLabelToArray = questionLabel.text?.split(separator: " ")
        
        questionLabelToArray?.forEach {
            guard let number = Int($0) else {return}
            
            switch isYesButton {
                
            case true:
                let countBefore = playerOne.card.numbersOnCard.count
                playerOne.checkCard(for: number)
                let countAfter = playerOne.card.numbersOnCard.count
                if countBefore == countAfter {
                    playerOne.mistake += 1
                    showAlert(with: "You made a mistake!!!", and: "You don't have this number. \n It was mistake #\(playerOne.mistake) of 3")
                }
                
            case false:
                let countBefore = playerOne.card.numbersOnCard.count
                playerOne.checkCard(for: number)
                let countAfter = playerOne.card.numbersOnCard.count
                if countBefore != countAfter {
                    playerOne.mistake += 1
                    showAlert(with: "You made a mistake!!!", and: "You have this number. \n It was mistake #\(playerOne.mistake) of 3")
                }
            }
            
            playerTwo.checkCard(for: number)
        }
        
        drawHumanCard(for: playerOne)
        drawCPUCard(for: playerTwo)
    
        if playerTwo.isWinner || playerOne.isWinner{
            let title = "Game is over"
            showAlert(with: title, and: "We have a winner!!!")
            questionLabel.text = title
            return
        }
        
        if playerOne.mistake == 3 {
            let title = "Game is over"
            showAlert(with: title, and: "You made 3 mistakes")
            questionLabel.text = title
            return
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

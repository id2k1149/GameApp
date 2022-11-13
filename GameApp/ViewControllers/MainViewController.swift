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
    
    @IBOutlet var cardView: UIView!
    
    @IBOutlet var playerOneRow1Collection: [UILabel]!
    @IBOutlet var playerOneRow2Collection: [UILabel]!
    @IBOutlet var playerOneRow3Collection: [UILabel]!
    
    @IBOutlet var playerTwoRow1Collection: [UILabel]!
    @IBOutlet var playerTwoRow2Collection: [UILabel]!
    @IBOutlet var playerTwoRow3Collection: [UILabel]!
    
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    
    var players: [Player] = Player.getPlayersList()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = getRandomNumber()
        
        cardView.layer.borderWidth = 3
        cardView.layer.cornerRadius = 10
        
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
        
//        playGame()
        
    }
    
    // MARK: - @IBActions
    
    
    @IBAction func yesButtontapped(_ sender: UIButton) {
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
    
    private func drawCPUCard(for player: Player) {
        player.card.getCard()
        
        for index in 0..<playerTwoRow1Collection.count {
//            print(row1Collection[index].text ?? "no value")
            playerTwoRow1Collection[index].text = player.card.row1[index].number
        }
        
        for index in 0..<playerTwoRow2Collection.count {
//            print(row2Collection[index].text ?? "no value")
            playerTwoRow2Collection[index].text = player.card.row2[index].number
        }
        
        for index in 0..<playerTwoRow3Collection.count {
//            print(row3Collection[index].text ?? "no value")
            playerTwoRow3Collection[index].text = player.card.row3[index].number
        }
    }
    
    private func drawHumanCard(for player: Player) {
        player.card.getCard()
        
        for index in 0..<playerOneRow1Collection.count {
//            print(row1Collection[index].text ?? "no value")
            playerOneRow1Collection[index].text = player.card.row1[index].number
        }
        
        for index in 0..<playerOneRow2Collection.count {
//            print(row2Collection[index].text ?? "no value")
            playerOneRow2Collection[index].text = player.card.row2[index].number
        }
        
        for index in 0..<playerOneRow3Collection.count {
//            print(row3Collection[index].text ?? "no value")
            playerOneRow3Collection[index].text = player.card.row3[index].number
        }
    }
    
    
        
    
    
    
    private func playGame() {
        let number = Int(questionLabel.text ?? "100")
        
        let playerOne = Player(isHumam: true)
        
        playerOne.checkCard(for: number ?? 100)
        
//        let playerTwo = Player(isHumam: false)
//        playerTwo.checkCard(for: number ?? 100)
    }
    
}

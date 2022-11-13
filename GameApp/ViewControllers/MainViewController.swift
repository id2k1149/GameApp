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
    
    @IBOutlet var playerNameLabel: UILabel!
    @IBOutlet var playerTwoNameLabel: UILabel!
    
    @IBOutlet var cardView: UIView!
    
    @IBOutlet var label_1_1: UILabel!
    @IBOutlet var label_1_2: UILabel!
    @IBOutlet var label_1_3: UILabel!
    @IBOutlet var label_1_4: UILabel!
    @IBOutlet var label_1_5: UILabel!
    @IBOutlet var label_1_6: UILabel!
    @IBOutlet var label_1_7: UILabel!
    @IBOutlet var label_1_8: UILabel!
    @IBOutlet var label_1_9: UILabel!
    
    @IBOutlet var label_2_1: UILabel!
    @IBOutlet var label_2_2: UILabel!
    @IBOutlet var label_2_3: UILabel!
    @IBOutlet var label_2_4: UILabel!
    @IBOutlet var label_2_5: UILabel!
    @IBOutlet var label_2_6: UILabel!
    @IBOutlet var label_2_7: UILabel!
    @IBOutlet var label_2_8: UILabel!
    @IBOutlet var label_2_9: UILabel!
    
    @IBOutlet var label_3_1: UILabel!
    @IBOutlet var label_3_2: UILabel!
    @IBOutlet var label_3_3: UILabel!
    @IBOutlet var label_3_4: UILabel!
    @IBOutlet var label_3_5: UILabel!
    @IBOutlet var label_3_6: UILabel!
    @IBOutlet var label_3_7: UILabel!
    @IBOutlet var label_3_8: UILabel!
    @IBOutlet var label_3_9: UILabel!
    
    
    @IBOutlet var row1Collection: [UILabel]!
    @IBOutlet var row2Collection: [UILabel]!
    @IBOutlet var row3Collection: [UILabel]!
    
    
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    
    var players: [Player] = Player.getPlayersList()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = getRandomNumber()
        
        cardView.layer.borderWidth = 3
        cardView.layer.cornerRadius = 10
        
        let playerOne = players[0]
        print(playerOne.name ?? "no name")
        guard let playerOneName = playerOne.name else { return }
        playerNameLabel.text = "\(playerOneName) card:"
        drawCard(for: playerOne)
        
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
        
        for index in 0..<row1Collection.count {
//            print(row1Collection[index].text ?? "no value")
            row1Collection[index].text = player.card.row1[index].number
        }
        
        for index in 0..<row2Collection.count {
//            print(row2Collection[index].text ?? "no value")
            row2Collection[index].text = player.card.row2[index].number
        }
        
        for index in 0..<row3Collection.count {
//            print(row3Collection[index].text ?? "no value")
            row3Collection[index].text = player.card.row3[index].number
        }
    }
    
    private func drawCard(for player: Player) {
        label_1_1.text = player.card.row1[0].number
        label_1_2.text = player.card.row1[1].number
        label_1_3.text = player.card.row1[2].number
        label_1_4.text = player.card.row1[3].number
        label_1_5.text = player.card.row1[4].number
        label_1_6.text = player.card.row1[5].number
        label_1_7.text = player.card.row1[6].number
        label_1_8.text = player.card.row1[7].number
        label_1_9.text = player.card.row1[8].number
        
        label_2_1.text = player.card.row2[0].number
        label_2_2.text = player.card.row2[1].number
        label_2_3.text = player.card.row2[2].number
        label_2_4.text = player.card.row2[3].number
        label_2_5.text = player.card.row2[4].number
        label_2_6.text = player.card.row2[5].number
        label_2_7.text = player.card.row2[6].number
        label_2_8.text = player.card.row2[7].number
        label_2_9.text = player.card.row2[8].number
        
        label_3_1.text = player.card.row3[0].number
        label_3_2.text = player.card.row3[1].number
        label_3_3.text = player.card.row3[2].number
        label_3_4.text = player.card.row3[3].number
        label_3_5.text = player.card.row3[4].number
        label_3_6.text = player.card.row3[5].number
        label_3_7.text = player.card.row3[6].number
        label_3_8.text = player.card.row3[7].number
        label_3_9.text = player.card.row3[8].number
    }
    
    private func playGame() {
        let number = Int(questionLabel.text ?? "100")
        
        let playerOne = Player(isHumam: true)
        
        playerOne.checkCard(for: number ?? 100)
        
//        let playerTwo = Player(isHumam: false)
//        playerTwo.checkCard(for: number ?? 100)
    }
    
}

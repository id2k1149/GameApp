//
//  Player.swift
//  GameApp
//
//  Created by Max Franz Immelmann on 11/11/22.
//

import Foundation

class Player {
    let name: String!
    let isHuman: Bool
    var isWinner: Bool = false
    var card = Card()
    var mistake = 0
    
    init(isHumam: Bool = true) {
        self.isHuman = isHumam
        if isHumam {
            name = "Your"
        } else {
            name = "Player #2"
        }
    }
    
}

extension Player {
    static func getPlayersList() -> [Player] {
        var players: [Player] = []
        
        for count in 0...1 {
            switch count {
            case 0:
                let player = Player(isHumam: true)
                players.append(player)
            default:
                let player = Player(isHumam: false)
                players.append(player)
            }
        }
    
        return players
    }
    
    func checkCard(for number: Int) {
        if card.numbersOnCard.contains(number) {
            guard let index = card.numbersOnCard.firstIndex(of: number) else { return }
            card.numbersOnCard.remove(at: index)
            
            checkRow(in: &card.row1, for: number)
            checkRow(in: &card.row2, for: number)
            checkRow(in: &card.row3, for: number)
        }
    }
    
    private func checkRow(in row: inout[(number: String, isCrossed: Bool)], for number: Int) {
        if let index = row.firstIndex(where: { $0.number == number.formatted() }) {
            row[index].isCrossed = true
        }
        
        var numberCrossed = 0
        row.forEach {
            if $0.isCrossed {
                numberCrossed += 1
            }
        }
        
        if numberCrossed == 5 {
            isWinner = true
        }
    }
}

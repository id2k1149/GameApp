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
    var bingo = 0
    
    init(isHumam: Bool = true) {
        self.isHuman = isHumam
        if isHumam {
            name = "My"
        } else {
            name = "CPU Player"
        }
    }
    
}

extension Player {
    static func getPlayersList() -> [Player] {
        var players: [Player] = []
        
        for count in 0...2 {
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
            
            let numberCrossed1 = checkRow(in: &card.row1, for: number)
            if numberCrossed1 == 5 {
                bingo += numberCrossed1
            }
            
            let numberCrossed2 = checkRow(in: &card.row2, for: number)
            if numberCrossed2 == 5 {
                bingo += numberCrossed2
            }
            
            let numberCrossed3 = checkRow(in: &card.row3, for: number)
            if numberCrossed3 == 5 {
                bingo += numberCrossed3
            }
            
            if bingo == 15 {
                isWinner = true
            }
        }
    }
    
    private func checkRow(in row: inout[(number: String, isCrossed: Bool)], for number: Int) -> Int {
        if let index = row.firstIndex(where: { $0.number == number.formatted() }) {
            row[index].isCrossed = true
        }
        
        var numberCrossed = 0
        row.forEach {
            if $0.isCrossed {
                numberCrossed += 1
            }
        }
        
        return numberCrossed
    }
}

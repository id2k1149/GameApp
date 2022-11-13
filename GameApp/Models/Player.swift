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
    var card = Card()
    
    init(isHumam: Bool = true) {
        self.isHuman = isHumam
        if isHumam {
            name = "My"
        } else {
            name = "CPU Player"
        }
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
        
        players.forEach {
            print($0.name ?? "no name", $0.isHuman)
        }
        
        return players
    }
}

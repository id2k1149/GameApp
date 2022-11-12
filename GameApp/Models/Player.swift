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
            name = "Your"
        } else {
            name = "Player #\(Int.random(in: 1...5))"
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

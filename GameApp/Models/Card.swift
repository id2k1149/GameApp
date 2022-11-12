//
//  Card.swift
//  GameApp
//
//  Created by Max Franz Immelmann on 11/11/22.
//

import Foundation

class Card {
    var numbersOnCard: [Int] = []
    
    var row1: [(number: String, isCrossed: Bool)] = []
    var row2: [(number: String, isCrossed: Bool)] = []
    var row3: [(number: String, isCrossed: Bool)] = []
    
    func getNewCard() {
        row1 = generateRow(isLastRow: false)
        row2 = generateRow(isLastRow: false)
        row3 = generateRow(isLastRow: true)
    }
    
    func generateRow(isLastRow: Bool) -> [(String, Bool)] {
        var counter = 0
        var initialArray = Array(1...90)
        var row = Array(repeating: ("", false), count: 9)
        
        while counter < 5 {
            let randomIndex = Int.random(in: 0..<initialArray.count)
            let randomNumber = initialArray[randomIndex]
            initialArray.remove(at: randomIndex)
            
            if !numbersOnCard.contains(randomNumber) {
                let index = randomNumber == 90 ? 8 : randomNumber / 10
                
                if row[index] == ("", false) {
                    
                    if isLastRow {
                        if row1[index] != ("", false) && row2[index] != ("", false) {
                            continue
                        }
                    }
                    
                    numbersOnCard.append(randomNumber)
                    numbersOnCard.sort()
                    row[index] = (randomNumber.formatted(), false)
                    counter += 1
                }
                
            } else {
                continue
            }
        }
        return row
    }
    
    func showCard() {
        print(numbersOnCard)
        print(row1)
        print(row2)
        print(row3)
    }
    
}

//
//  Card.swift
//  GameApp
//
//  Created by Max Franz Immelmann on 11/11/22.
//

import Foundation

class Card {
    var numbersOnCard: [Int] = []
    var row1: [String] = []
    var row2: [String] = []
    var row3: [String] = []
    
    func getNewCard() {
        row1 = generateRow(isLastRow: false)
        row2 = generateRow(isLastRow: false)
        row3 = generateRow(isLastRow: true)
    }
    
    func generateRow(isLastRow: Bool) -> [String] {
        var counter = 0
        var initialArray = Array(1...90)
        var row = Array(repeating: "", count: 9)
        
        while counter < 5 {
            let randomIndex = Int.random(in: 0..<initialArray.count)
            let randomNumber = initialArray[randomIndex]
            initialArray.remove(at: randomIndex)
            
            if !numbersOnCard.contains(randomNumber) {
                let index = randomNumber == 90 ? 8 : randomNumber / 10
                
                if row[index] == "" {
                    
                    if isLastRow {
                        if row1[index] != "" && row2[index] != "" {
                            continue
                        }
                    }
                    
                    numbersOnCard.append(randomNumber)
                    numbersOnCard.sort()
                    row[index] = randomNumber.formatted()
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
    }
    
}

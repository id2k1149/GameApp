//
//  Card.swift
//  GameApp
//
//  Created by Max Franz Immelmann on 11/11/22.
//

import Foundation

class Card {
    var row1: [(number: String, isCrossed: Bool)]!
    var row2: [(number: String, isCrossed: Bool)]!
    var row3: [(number: String, isCrossed: Bool)]!
    
    var numbersOnCard: [Int] = []
    
    init() {
        row1 = setRow(for: "row 1")
        row2 = setRow(for: "row 2")
        row3 = setRow(for: "row 3")
    }
    
    private func setRow(for rowNumber: String) -> [(String, Bool)] {
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
                    switch rowNumber {
                    case "row 2":
                        if counter < 3 && row1[index] != ("", false) {
                            continue
                        }
                    case "row 3":
                        if counter < 4 && row2[index] != ("", false) {
                            continue
                        }
                        
                    default:
                        break
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
    
    func getCard() {
        print(numbersOnCard)
        print(getRow(row1))
        print(getRow(row2))
        print(getRow(row3))
    }
    
    private func getRow(_ row: [(number: String, isCrossed: Bool)]) -> String {
        var result = ""
        row.forEach {
            result += $0.number + " "
        }
        return result
    }
    
}

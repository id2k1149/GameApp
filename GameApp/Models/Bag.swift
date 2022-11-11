//
//  Bag.swift
//  GameApp
//
//  Created by Max Franz Immelmann on 11/11/22.
//

import Foundation

class Bag {
    static let shared = Bag()
    
    var barrels = Array(1...99)
    
    private init() {}
    
    func getRandomNumber() -> Int {
        let randomIndex = Int.random(in: 0..<barrels.count)
        let randomNumber = barrels[randomIndex]
        self.barrels.remove(at: randomIndex)
        return randomNumber
    }
}

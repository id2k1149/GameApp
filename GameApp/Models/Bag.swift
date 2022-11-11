//
//  Bag.swift
//  GameApp
//
//  Created by Max Franz Immelmann on 11/11/22.
//

class Bag {
    static let shared = Bag()
    
    var barrels = Array(1...5)
    
    private init() {}
    
    func getNextBarrel() -> String {
        if barrels.count == 0 {
            return "Bag is empty"
        } else {
            let randomIndex = Int.random(in: 0..<barrels.count)
            let randomNumber = barrels[randomIndex]
            self.barrels.remove(at: randomIndex)
            return randomNumber.formatted()
        }
    }
}

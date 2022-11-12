//
//  Player.swift
//  GameApp
//
//  Created by Max Franz Immelmann on 11/11/22.
//

import Foundation

class Player {
    let isHuman: Bool
    var card = Card()
    
    init(isHumam: Bool = true) {
        self.isHuman = isHumam
        card.getNewCard()
    }
    
    func play() {
        if isHuman {
            playAsHuman()
        } else {
            playAsCPU()
        }
    }
    
    func playAsHuman() {
        print("playAsHuman()")
//        card.showCard()
        
    }
    
    func playAsCPU() {
        
    }
    
}

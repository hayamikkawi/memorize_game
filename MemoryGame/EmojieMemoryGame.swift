//
//  EmojieMemoryGame.swift
//  MemoryGame
//
//  Created by Haya Mikkawi on 25/11/2023.
//

import SwiftUI

class EmojieMemoryGame: ObservableObject {
    private static let emojis = ["🎃", "👻" , "💀", "😇"]
    
    private static func createModel () -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { index in
            guard index < emojis.indices.count else { return "NO" }
            return emojis[index] }
    }
    
    @Published private var model = createModel()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}

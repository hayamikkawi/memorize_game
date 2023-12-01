//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Haya Mikkawi on 19/11/2023.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    @StateObject var game = EmojieMemoryGame()
    var body: some Scene {
        WindowGroup {
            MemoryGameView(viewModel: game)
        }
    }
}

//
//  Theme.swift
//  MemoryGame
//
//  Created by Haya Mikkawi on 24/11/2023.
//

import SwiftUI

enum Theme: CaseIterable {
    case halloween
    case vehicles
    case animals
    
    var title: String {
        switch self {
        case .halloween:
            return "Halloween"
        case .vehicles:
            return "Vehicles"
        case .animals:
            return "Animals"
        }
    }
    
    var icon: String {
        switch self {
        case .halloween:
            return "face.smiling"
        case .vehicles:
            return "car"
        case .animals:
            return "pawprint"
        }
    }
    
    var color: Color {
        switch self {
        case .halloween:
            return .orange
        case .vehicles:
            return .blue
        case .animals:
            return .red
        }
    }
    
    var emojies: [String] {
        switch self {
        case .halloween:
            return ["🎃", "👻" , "💀", "😇"]
        case .vehicles:
            return ["🚗", "🚁" , "🚆", "🚲"]
        case .animals:
            return ["🐎", "🦒" , "🦓", "🦋"]
        }
    }
    
}

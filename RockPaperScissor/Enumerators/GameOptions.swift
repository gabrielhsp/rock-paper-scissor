//
//  GameOptions.swift
//  RockPaperScissor
//
//  Created by Gabriel Pereira on 19/03/22.
//

enum GameOptions: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissor = "Scissor"
    
    var emoji: String {
        switch self {
        case .rock:
            return "🪨"
        case .paper:
            return "🔖"
        case .scissor:
            return "✂️"
        }
    }
}

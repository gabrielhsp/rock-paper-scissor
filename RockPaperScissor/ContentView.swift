//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Gabriel Pereira on 19/03/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property Wrappers
    @State private var gameScore: Int = 0
    @State private var gameSelectedOption: GameOptions = GameOptions.allCases[Int.random(in: 0...2)]
    @State private var willUserWinOrLose: Bool = Bool.random()
    @State private var userSelectedOption: GameOptions = .rock
    
    // MARK: - Properties
    private let gameOptions: [GameOptions] = GameOptions.allCases
    
    // MARK: - UI Components
    var body: some View {
        VStack(spacing: 24) {
            VStack(alignment: .center) {
                Text("Rock, Paper or Scissor")
                    .font(.title.bold())
                
                Text("You need to **\(getWinOrLoose())** the game to increase your score:")
                    .multilineTextAlignment(.center)
            }
            
            VStack {
                GameOptionButton(gameOption: gameSelectedOption) {
                }
            }
            
            HStack(spacing: 24) {
                ForEach(0..<gameOptions.count) { number in
                    GameOptionButton(gameOption: gameOptions[number]) {
                        userSelectedOption = gameOptions[number]
                        setUserScore()
                    }
                }
            }
            
            VStack {
                Text("Score: \(gameScore)")
                    .font(.title.bold())
            }
        }
    }
    
    // MARK: - Private Methods
    private func getWinOrLoose() -> String {
        return willUserWinOrLose ? "win" : "loose"
    }
    
    private func setUserScore() {
        let gameState: GameScoreResult = userWinLooseOrTie()
        
        if gameState == .win && willUserWinOrLose {
            gameScore += 1
        }
        
        if gameState == .loose && !willUserWinOrLose {
            gameScore += 1
        }
    }
    
    private func userWinLooseOrTie() -> GameScoreResult {
        switch gameSelectedOption {
        case .rock:
            switch userSelectedOption {
            case .rock:
                return .tie
            case .paper:
                return .win
            case .scissor:
                return .loose
            }
        case .paper:
            switch userSelectedOption {
            case .rock:
                return .loose
            case .paper:
                return .tie
            case .scissor:
                return .win
            }
        case .scissor:
            switch userSelectedOption {
            case .rock:
                return .win
            case .paper:
                return .loose
            case .scissor:
                return .tie
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

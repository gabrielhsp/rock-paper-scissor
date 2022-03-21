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
    @State private var gameAnswer: Int = Int.random(in: 0...2)
    @State private var willUserWinOrLose: Bool = Bool.random()
    @State private var gameOptions: [GameOptions] = GameOptions.allCases
    @State private var userGameTries: Int = 0
    @State private var showEndingGame: Bool = false
    
    // MARK: - Properties
    private let maximumGameTries: Int = 8
    
    // MARK: - UI Components
    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                VStack(alignment: .center, spacing: 4) {
                    Text("Rock, Paper or Scissor")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    
                    Text("You need to **\(getWinOrLoose())** the game to increase your score:")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                .padding()
                
                GameSelectionOption(gameOption: gameOptions[gameAnswer])
                
                HStack(spacing: 8) {
                    ForEach(0..<gameOptions.count) { number in
                        GameOptionButton(gameOption: gameOptions[number]) {
                            updateGameScore(userSelection: gameOptions[number])
                        }
                    }
                }
                .padding()
                
                VStack {
                    Text("Score: \(gameScore)")
                        .font(.title.bold())
                        .foregroundColor(.white)
                }
            }
        }
        .preferredColorScheme(.dark)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "#060a47"))
        .alert("The game has ended", isPresented: $showEndingGame) {
            Button("Reset game", role: .cancel, action: resetGame)
        } message : {
            Text("Congratulations! You're final score is \(gameScore). Reset the game to play again.")
        }
    }
    
    // MARK: - Private Methods
    private func resetGame() {
        gameScore = 0
        userGameTries = 0
        shuffleGame()
    }
    
    private func shuffleGame() {
        willUserWinOrLose.toggle()
        gameAnswer = Int.random(in: 0...2)
    }
    
    private func shouldEndGame() {
        userGameTries += 1
        showEndingGame = (userGameTries == maximumGameTries ? true : false)
    }
    
    private func getWinOrLoose() -> String {
        return willUserWinOrLose ? "win" : "loose"
    }
    
    private func updateGameScore(userSelection: GameOptions) {
        let gameState: GameScoreResult = userWinLooseOrTie(userSelection: userSelection)
        
        if gameState == .win && willUserWinOrLose {
            gameScore += 1
        }
        
        if gameState == .loose && !willUserWinOrLose {
            gameScore += 1
        }
        
        shouldEndGame()
        shuffleGame()
    }
    
    private func userWinLooseOrTie(userSelection: GameOptions) -> GameScoreResult {
        let gameSelectedOption: GameOptions = gameOptions[gameAnswer]
        
        switch gameSelectedOption {
        case .rock:
            switch userSelection {
            case .rock:
                return .tie
            case .paper:
                return .win
            case .scissor:
                return .loose
            }
        case .paper:
            switch userSelection {
            case .rock:
                return .loose
            case .paper:
                return .tie
            case .scissor:
                return .win
            }
        case .scissor:
            switch userSelection {
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

//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Gabriel Pereira on 19/03/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property Wrappers
    @State private var gameSelectedOption: GameOptions = .rock
    @State private var willUserWinOrLose: Bool = Bool.random()
    
    // MARK: - Properties
    private let gameOptions: [GameOptions] = GameOptions.allCases
    
    // MARK: - UI Components
    var body: some View {
        VStack(spacing: 24) {
            VStack {
                Text("Rock, Paper or Scissor")
                    .font(.largeTitle)
                
                Text("Choose the option that will make you \(getWinOrLoose()) the game")
            }
            
            HStack(spacing: 24) {
                ForEach(0..<gameOptions.count) { number in
                    GameOptionButton(gameOption: gameOptions[number]) {
                        print(gameOptions[number].rawValue)
                    }
                }
            }
        }
    }
    
    // MARK: - Private Methods
    private func getWinOrLoose() -> String {
        return willUserWinOrLose ? "win" : "loose"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

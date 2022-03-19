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
        HStack(spacing: 24) {
            ForEach(0..<gameOptions.count) { number in
                Button {
                    print(gameOptions[number].rawValue)
                } label: {
                    VStack(spacing: 8) {
                        Text(gameOptions[number].emoji)
                            .font(.system(size: 60))
                        Text(gameOptions[number].rawValue)
                            .font(.footnote)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  GameOptionButton.swift
//  RockPaperScissor
//
//  Created by Gabriel Pereira on 20/03/22.
//

import SwiftUI

struct GameOptionButton: View {
    var gameOption: GameOptions
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            VStack(alignment: .center, spacing: 8) {
                Text(gameOption.emoji)
                    .font(.system(size: 40))
                Text(gameOption.rawValue)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
        })
        .padding(24)
        .background(.red)
        .cornerRadius(8)
    }
}

struct GameOptionButton_Previews: PreviewProvider {
    static var previews: some View {
        GameOptionButton(gameOption: .rock) {
        }
    }
}

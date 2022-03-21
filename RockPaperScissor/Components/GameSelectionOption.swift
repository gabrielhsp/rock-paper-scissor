//
//  GameSelectionOption.swift
//  RockPaperScissor
//
//  Created by Gabriel Pereira on 20/03/22.
//

import SwiftUI

struct GameSelectionOption: View {
    // MARK: - Properties
    var gameOption: GameOptions
    
    // MARK: - UI Components
    var body: some View {
        VStack(spacing: Constants.Spaces.small.rawValue) {
            Text(gameOption.emoji)
                .font(.system(size: 40))
            
            Text(gameOption.rawValue)
                .font(.subheadline.bold())
                .foregroundColor(.white)
        }
        .padding(44)
        .background(Constants.Colors.lightBlue)
        .clipShape(Circle())
    }
}

struct GameSelectionOption_Previews: PreviewProvider {
    static var previews: some View {
        GameSelectionOption(gameOption: .rock)
    }
}

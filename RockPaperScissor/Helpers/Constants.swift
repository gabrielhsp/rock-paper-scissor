//
//  Constants.swift
//  RockPaperScissor
//
//  Created by Gabriel Pereira on 21/03/22.
//

import SwiftUI

public struct Constants {
    public struct Colors {
        static let darkBlue: Color = Color(hex: "#060a47")
        static let lightBlue: Color = Color(hex: "#2eb2f7")
        static let darkPink: Color = Color(hex: "#e5359c")
    }
    
    public enum Spaces: CGFloat {
        case extraSmall = 4
        case small = 8
        case `default` = 16
        case large = 24
    }
}

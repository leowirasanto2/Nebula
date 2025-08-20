//
//  Typography+Font.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 20/08/25.
//

import SwiftUI

public extension Typography {
    var font: Font {
        switch self {
        // Title styles
        case .titleRegular:
            return .NebulaFonts.fixed(.semibold, size: .large)
        case .titleLarge:
            return .NebulaFonts.fixed(.bold, size: .extraLarge2)
        case .titleMedium:
            return .NebulaFonts.fixed(.medium, size: .large)

        // Subtitle style
        case .subtitle:
            return .NebulaFonts.fixed(.medium, size: .medium)
        case .subtitleRegular:
            return .NebulaFonts.fixed(.regular, size: .medium)

        // Body styles
        case .bodyRegular:
            return .NebulaFonts.fixed(.regular, size: .small)
        case .bodyMedium:
            return .NebulaFonts.fixed(.medium, size: .small)
        case .bodySmall:
            return .NebulaFonts.fixed(.thin, size: .small)

        // Caption styles
        case .captionRegular:
            return .NebulaFonts.fixed(.regular, size: .extraSmall)
        case .captionSmall:
            return .NebulaFonts.fixed(.thin, size: .extraSmall)
        case .captionMedium:
            return .NebulaFonts.fixed(.medium, size: .extraSmall)
        }
    }
}

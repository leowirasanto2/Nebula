//
//  Typography.swift
//  MiniSAPlayground
//
//  Created by Leo Wirasanto Laia on 26/07/25.
//

import Foundation
import SwiftUI

public enum Typography: String, CaseIterable {
    // Title styles
    case titleRegular
    case titleLarge
    case titleMedium

    // Subtitle style
    case subtitle
    case subtitleRegular

    // Body styles
    case bodyMedium
    case bodySmall
    case bodyRegular

    // Caption styles
    case captionRegular
    case captionSmall
    case captionMedium
}

// Extension for SwiftUI View
public extension View {
    func typography(_ style: Typography) -> some View {
        self.font(style.font)
    }
}

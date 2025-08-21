//
//  ColorToken.swift
//  MiniSAPlayground
//
//  Created by Leo Wirasanto Laia on 26/07/25.
//

import Foundation
import SwiftUI

public enum ColorToken: String, CaseIterable {
    case backgroundPrimary
    case backgroundSecondary
    case backgroundTertiary
    
    case typographyPrimary
    case typopraphySecondary
    case typographyDisabled
    
    case buttonPrimary
    case buttonSecondary
    case buttonTertiary
    case buttonPositive
    case buttonNegative
    case buttonDisabled
    case buttonWarning
    
    case borderPrimary
    case borderDisabled
    case borderTertiary
    case borderPositive
    case borderNegative
    case borderWarning
    
    case staticWhite
}

// Extension for SwiftUI View
public extension View {
    func colorToken(_ token: ColorToken) -> some View {
        self.foregroundColor(token.color)
    }
}

public extension ColorToken {
    var color: Color {
        switch self {
        case .backgroundPrimary:
            return ColorSet.color(.background(colorState: .primary))
        case .backgroundSecondary:
            return ColorSet.color(.background(colorState: .secondary))
        case .backgroundTertiary:
            return ColorSet.color(.background(colorState: .tertiary))
        case .typographyPrimary:
            return ColorSet.color(.typography(colorState: .primary))
        case .typopraphySecondary:
            return ColorSet.color(.typography(colorState: .secondary))
        case .typographyDisabled:
            return ColorSet.color(.typography(colorState: .disabled))
        case .buttonPrimary:
            return ColorSet.color(.buttonFill(colorState: .primary))
        case .buttonSecondary:
            return ColorSet.color(.buttonFill(colorState: .secondary))
        case .buttonTertiary:
            return ColorSet.color(.buttonFill(colorState: .tertiary))
        case .buttonPositive:
            return ColorSet.color(.buttonFill(colorState: .positive))
        case .buttonNegative:
            return ColorSet.color(.buttonFill(colorState: .negative))
        case .buttonDisabled:
            return ColorSet.color(.buttonFill(colorState: .disabled))
        case .borderPrimary:
            return ColorSet.color(.border(colorState: .primary))
        case .borderDisabled:
            return ColorSet.color(.border(colorState: .disabled))
        case .borderTertiary:
            return ColorSet.color(.border(colorState: .tertiary))
        case .borderPositive:
            return ColorSet.color(.border(colorState: .positive))
        case .borderNegative:
            return ColorSet.color(.border(colorState: .negative))
        case .buttonWarning:
            return ColorSet.color(.buttonFill(colorState: .warning))
        case .borderWarning:
            return ColorSet.color(.border(colorState: .warning))
        case .staticWhite:
            return Color.white
        }
    }

    var uiColor: UIColor {
        UIColor(self.color)
    }
}

// Extension for UIKit
public extension UILabel {
    func setColorToken(_ token: ColorToken) {
        self.textColor = token.uiColor
    }
}

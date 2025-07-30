//
//  ColorToken.swift
//  MiniSAPlayground
//
//  Created by Leo Wirasanto Laia on 26/07/25.
//

import Foundation
import SwiftUI

public enum ColorToken: String, CaseIterable {
    case labelDefault
    case labelStaticWhite
    case labelDisabled
    case labelActive // blue

    case backgroundDefault
    case backgroundDisabled

    case borderDisabled
    case borderDefault
    case borderStaticWhite

    case buttonActive // blue
    case buttonDisabled // gray disabled
    case buttonWarning // yellow
    case buttonNegative // red
    
    case checkboxPrimary // black
    case checkboxSecondary // orange
    case checkboxDisabled // gray disabled

    public var color: Color {
        switch self {
        case .labelDefault:
            return Color(red: 0, green: 0, blue: 0)
        case .labelStaticWhite:
            return Color(red: 1, green: 1, blue: 1)
        case .labelDisabled:
            return Color(red: 0.6, green: 0.6, blue: 0.6)
        case .labelActive:
            return Color(red: 0.0, green: 0.5, blue: 1.0) // Blue Active
        case .backgroundDefault:
            return Color(red: 0.95, green: 0.95, blue: 0.95)
        case .backgroundDisabled:
            return Color(red: 0.8, green: 0.8, blue: 0.8)
        case .borderDisabled:
            return Color(red: 0.8, green: 0.8, blue: 0.8)
        case .borderDefault:
            return Color(red: 0.9, green: 0.9, blue: 0.9)
        case .borderStaticWhite:
            return Color(red: 1, green: 1, blue: 1)
        case .buttonActive:
            return Color(red: 0.0, green: 0.5, blue: 1.0) // Blue
        case .buttonDisabled:
            return Color(red: 0.8, green: 0.8, blue: 0.8) // Gray Disabled
        case .buttonWarning:
            return Color(red: 1.0, green: 0.85, blue: 0.0) // Yellow
        case .buttonNegative:
            return Color(red: 1.0, green: 0.0, blue: 0.0) // Red
        case .checkboxPrimary:
            return Color(red: 0.0, green: 0.0, blue: 0.0) // Black
        case .checkboxSecondary:
            return Color(red: 1.0, green: 0.65, blue: 0.0) // Orange
        case .checkboxDisabled:
            return Color(red: 0.8, green: 0.8, blue: 0.8) // Gray Disabled
        }
    }

    public var uiColor: UIColor {
        UIColor(self.color)
    }
}

// Extension for SwiftUI View
public extension View {
    func colorToken(_ token: ColorToken) -> some View {
        self.foregroundColor(token.color)
    }
}

// Extension for UIKit
public extension UILabel {
    func setColorToken(_ token: ColorToken) {
        self.textColor = token.uiColor
    }
}

public enum AlphabethColor: String, CaseIterable, Equatable {
    case letterA = "A"
    case letterB = "B"
    case letterC = "C"
    case letterD = "D"
    case letterE = "E"
    case letterF = "F"
    case letterG = "G"
    case letterH = "H"
    case letterI = "I"
    case letterJ = "J"
    case letterK = "K"
    case letterL = "L"
    case letterM = "M"
    case letterN = "N"
    case letterO = "O"
    case letterP = "P"
    case letterQ = "Q"
    case letterR = "R"
    case letterS = "S"
    case letterT = "T"
    case letterU = "U"
    case letterV = "V"
    case letterW = "W"
    case letterX = "X"
    case letterY = "Y"
    case letterZ = "Z"
    
    public var identityColor: Color {
        switch self {
        case .letterA: return Color(red: 1, green: 0, blue: 0) // Red
        case .letterB: return Color(red: 0, green: 1, blue: 0) // Green
        case .letterC: return Color(red: 0, green: 0, blue: 1) // Blue
        case .letterD: return Color(red: 1, green: 1, blue: 0) // Yellow
        case .letterE: return Color(red: 1, green: 0, blue: 1) // Magenta
        case .letterF: return Color(red: 0, green: 1, blue: 1) // Cyan
        case .letterG: return Color(red: 0.5, green: 0.5, blue: 0) // Olive
        case .letterH: return Color(red: 0.5, green: 0, blue: 0.5) // Purple
        case .letterI: return Color(red: 0, green: 0.5, blue: 0.5) // Teal
        case .letterJ: return Color(red: 0.5, green: 0.25, blue: 0) // Brown
        case .letterK: return Color(red: 0.75, green: 0.75, blue: 0.75) // Light Gray
        case .letterL: return Color(red: 0.25, green: 0.25, blue: 0.25) // Dark Gray
        case .letterM: return Color(red: 1, green: 0.5, blue: 0) // Orange
        case .letterN: return Color(red: 0.5, green: 0, blue: 0) // Maroon
        case .letterO: return Color(red: 0, green: 0.5, blue: 0) // Dark Green
        case .letterP: return Color(red: 0.5, green: 0, blue: 0.5) // Dark Purple
        case .letterQ: return Color(red: 0.5, green: 0.5, blue: 0) // Dark Olive
        case .letterR: return Color(red: 1, green: 0, blue: 0.5) // Pink
        case .letterS: return Color(red: 0.5, green: 0.5, blue: 1) // Light Blue
        case .letterT: return Color(red: 0.5, green: 1, blue: 0.5) // Light Green
        case .letterU: return Color(red: 0.5, green: 0.5, blue: 0.5) // Gray
        case .letterV: return Color(red: 0.75, green: 0.5, blue: 0.25) // Tan
        case .letterW: return Color(red: 0.75, green: 0.75, blue: 0) // Light Yellow
        case .letterX: return Color(red: 0.5, green: 0.25, blue: 0.5) // Lavender
        case .letterY: return Color(red: 1, green: 1, blue: 0.5) // Light Yellow
        case .letterZ: return Color(red: 0.5, green: 0.5, blue: 0.75) // Light Blue Gray
        }
    }
}

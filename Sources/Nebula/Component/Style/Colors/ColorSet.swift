//
//  File.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 21/08/25.
//

import Foundation
import SwiftUI

public enum ColorState: String, CaseIterable {
    case primary
    case secondary
    case tertiary
    case negative
    case positive
    case disabled
    case warning
}

public enum ColorType: Equatable {
    case background(colorState: ColorState)
    case typography(colorState: ColorState)
    case buttonFill(colorState: ColorState)
    case border(colorState: ColorState)
}


public struct ColorSet {
    public static func color(_ type: ColorType) -> Color {
        switch type {
            
        case .background(let state):
            switch state {
            case .primary:   return Color(hex: "F3F3F3")
            case .secondary: return Color(hex: "9F9F9F")
            case .tertiary:  return Color(hex: "303030")
            default: return .clear
            }
            
        case .typography(let state):
            switch state {
            case .primary:   return Color(hex: "262626")
            case .secondary: return Color(hex: "4B4B4B")
            case .disabled: return Color(hex: "B3B3B3")
            default: return .clear
            }
            
        case .buttonFill(let state):
            switch state {
            case .primary:   return Color(hex: "A93474")
            case .secondary: return Color(hex: "7C2B57")
            case .tertiary:  return Color(hex: "303030")
            case .negative:  return Color(hex: "B70E11")
            case .positive:  return Color(hex: "086E1E")
            case .disabled:  return Color(hex: "A8A8A8")
            case .warning: return Color(hex: "FF870F")
            }
            
        case .border(let state):
            switch state {
            case .primary:   return Color(hex: "979797")
            case .secondary: return Color(hex: "9E9E9E")
            case .tertiary:  return Color(hex: "575757")
            case .negative:  return Color(hex: "B70E11")
            case .positive:  return Color(hex: "086E1E")
            case .disabled:  return Color(hex: "B5B5B5")
            case .warning: return Color(hex: "FF870F")
            }
        }
    }
}

private extension Color {
    init(hex: String, alpha: Double = 1) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r = Double((int >> 16) & 0xFF) / 255.0
        let g = Double((int >>  8) & 0xFF) / 255.0
        let b = Double(int & 0xFF) / 255.0
        self.init(.sRGB, red: r, green: g, blue: b, opacity: alpha)
    }
}


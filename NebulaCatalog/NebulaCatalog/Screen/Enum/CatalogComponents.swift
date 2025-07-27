//
//  CatalogComponents.swift
//  NebulaCatalog
//
//  Created by Leo Wirasanto Laia on 27/07/25.
//

import Foundation

enum CatalogComponents: Equatable, CaseIterable {
    case inputFields
    case buttons
    case illustrations
    case colorTokens
    case typographys
    case spacing
    
    var title: String {
        switch self {
        case .inputFields:
            return "Input Field"
        case .buttons:
            return "Buttons"
        case .illustrations:
            return "Illustration"
        case .colorTokens:
            return "Color Token"
        case .typographys:
            return "Typography"
        case .spacing:
            return "Spacing"
        }
    }
}

enum Buttons: Equatable, CaseIterable {
    case primary
    case secondary
    
    var title: String {
        switch self {
        case .primary:
            return "Primary Button"
        case .secondary:
            return "Secondary Button"
        }
    }
}

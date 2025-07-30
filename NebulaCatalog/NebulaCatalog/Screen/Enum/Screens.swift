//
//  Screens.swift
//  NebulaCatalog
//
//  Created by Leo Wirasanto Laia on 27/07/25.
//

enum Screens: Equatable, Hashable, CaseIterable {
    case inputFieldsDetail
    case buttonsDetail
    case illustrationsDetail
    case colorTokensDetail
    case typographysDetail
    case spacingDetail
    
    var title: String {
        switch self {
        case .inputFieldsDetail:
            return "Input Field"
        case .buttonsDetail:
            return "Buttons"
        case .illustrationsDetail:
            return "Illustration"
        case .colorTokensDetail:
            return "Color Token"
        case .typographysDetail:
            return "Typography"
        case .spacingDetail:
            return "Spacing"
        }
    }
}

extension CatalogComponents {
    func toScreens() -> Screens {
        switch self {
        case .inputFields:
            return .inputFieldsDetail
        case .buttons:
            return .buttonsDetail
        case .illustrations:
            return .illustrationsDetail
        case .colorTokens:
            return .colorTokensDetail
        case .typographys:
            return .typographysDetail
        case .spacing:
            return .spacingDetail
        }
    }
}

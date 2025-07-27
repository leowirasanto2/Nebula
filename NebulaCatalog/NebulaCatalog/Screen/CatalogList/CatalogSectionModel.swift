//
//  CatalogSectionModel.swift
//  NebulaCatalog
//
//  Created by Leo Wirasanto Laia on 27/07/25.
//

import Foundation
import SwiftUI
import Nebula

struct CatalogSection {
    var id: String
    var title: String
    var components: [Components]
}

extension CatalogSection {
    static let data: [CatalogSection] = [
        .init(
            id: "ui-section",
            title: "UI Component",
            components: Components.uiSection
        ),
        .init(
            id: "ic-illustration-section",
            title: "Icon or Illustration",
            components: Components.iconOrIllustrations
        ),
        .init(
            id: "style-section",
            title: "Style",
            components: Components.styleSection
        ),
        .init(
            id: "Spacing",
            title: "Spacing",
            components: Components.spacingSection
        )
    ]
}

extension Components {
    static let uiSection: [Components] = [
        .buttons,
        .inputFields
    ]
    
    static let iconOrIllustrations: [Components] = [
        .illustrations
    ]
    
    static let styleSection: [Components] = [
        .colorTokens,
        .typographys
    ]
    
    static let spacingSection: [Components] = [
        .spacing
    ]
}


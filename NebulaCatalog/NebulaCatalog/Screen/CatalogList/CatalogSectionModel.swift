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
    var components: [CatalogComponents]
}

extension CatalogSection {
    static let data: [CatalogSection] = [
        .init(
            id: "ui-section",
            title: "UI Component",
            components: CatalogComponents.uiSection
        ),
        .init(
            id: "ic-illustration-section",
            title: "Icon or Illustration",
            components: CatalogComponents.iconOrIllustrations
        ),
        .init(
            id: "style-section",
            title: "Style",
            components: CatalogComponents.styleSection
        ),
        .init(
            id: "Spacing",
            title: "Spacing",
            components: CatalogComponents.spacingSection
        )
    ]
}

extension CatalogComponents {
    static let uiSection: [CatalogComponents] = [
        .buttons,
        .inputFields
    ]
    
    static let iconOrIllustrations: [CatalogComponents] = [
        .illustrations
    ]
    
    static let styleSection: [CatalogComponents] = [
        .colorTokens,
        .typographys
    ]
    
    static let spacingSection: [CatalogComponents] = [
        .spacing
    ]
}


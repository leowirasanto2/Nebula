//
//  ButtonCatalogViewModel.swift
//  NebulaCatalog
//
//  Created by Leo Wirasanto Laia on 27/07/25.
//
import Combine
import SwiftUI
import Nebula

final class ButtonCatalogViewModel: ObservableObject {
    enum AllButtons: CaseIterable, Identifiable {
        case primary
        case secondary
        
        var id: String { self.label }
        
        var label: String {
            switch self {
            case .primary:
                return "Primary Button"
            case .secondary:
                return "Secondary Button"
            }
        }
    }
    
    @Published var slider: CGFloat = 0
    @Published var buttonSize: ButtonSizeCatalog = .medium
    @Published var buttonType: ButtonTypeCatalog = .active
    @Published var selectedButtonComponent: AllButtons = .primary
    @Published var isLoading = false
}

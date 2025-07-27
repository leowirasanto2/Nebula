//
//  ButtonCatalogContainer.swift
//  NebulaCatalog
//
//  Created by Leo Wirasanto Laia on 27/07/25.
//

import Foundation
import Nebula
import SwiftUI

struct ButtonCatalogContainer: View {
    @EnvironmentObject var model: ButtonCatalogViewModel
    
    var body: some View {
        VStack {
            Picker("Select Button Component", selection: $model.selectedButtonComponent) {
                ForEach(ButtonCatalogViewModel.AllButtons.allCases, id: \.id) { type in
                    Text(type.label).tag(type)
                }
            }
            .pickerStyle(.segmented)
            .paddingHorizontal(.regular)
            
            VStack {
                switch model.selectedButtonComponent {
                case .primary:
                    PrimaryButtonCatalog()
                        .environmentObject(model)
                case .secondary:
                    SecondaryButtonCatalog()
                        .environmentObject(model)
                }
                
                VStack(alignment: .leading) {
                    Text("Configurations")
                        .paddingHorizontal(.regular)
                        .paddingVertical(.small)
                        .typography(.bodyMedium)
                        .colorToken(.labelStaticWhite)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(ColorToken.buttonWarning.color)
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Corner radius: \(Int(model.slider))")
                                .typography(.bodySmall)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Slider(
                                value: Binding(
                                    get: { model.slider },
                                    set: { newValue in
                                        model.slider = CGFloat((Int(newValue) / 2) * 2)
                                    }
                                ),
                                in: 0...32,
                                step: 1
                            )
                            .paddingHorizontal(.small)
                        }
                        .paddingHorizontal(.regular)
                        .padding(.top, 16)
                        
                        VStack(alignment: .leading) {
                            Text("Size: \(model.buttonSize.label)")
                                .typography(.bodySmall)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Picker("Size", selection: $model.buttonSize) {
                                ForEach(ButtonSizeCatalog.allCases, id: \.id) { size in
                                    Text(size.label).tag(size)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        .paddingHorizontal(.regular)
                        .padding(.top, 16)
                        
                        VStack(alignment: .leading) {
                            Text("Type: \(model.buttonType.label)")
                                .typography(.bodySmall)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Picker("Size", selection: $model.buttonType) {
                                ForEach(ButtonTypeCatalog.allCases, id: \.id) { type in
                                    Text(type.label).tag(type)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        .paddingHorizontal(.regular)
                        .padding(.top, 16)
                        
                        VStack(alignment: .leading) {
                            Text("Is Loading: \(model.isLoading.description)")
                                .typography(.bodySmall)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            SecondaryButton(
                                title: model.isLoading ? "Cancel Loading" : "Set Loading",
                                action: {
                                    withAnimation {
                                        model.isLoading.toggle()
                                    }
                                }
                            )
                        }
                        .paddingHorizontal(.regular)
                        .padding(.top, 16)
                    }
                }
            }
        }
    }
}

#Preview {
    ButtonCatalogContainer()
        .environmentObject(ButtonCatalogViewModel())
}

enum ButtonSizeCatalog: String, Equatable, CaseIterable, Hashable {
    case small
    case medium
    case large
    
    var id: String { self.rawValue }
    
    var label: String {
        switch self {
        case .small: return "Small"
        case .medium: return "Medium"
        case .large: return "Large"
        }
    }
    
    func toPrimaryButtonSize() -> PrimaryButton.Size {
        switch self {
        case .small:
            return .small
        case .medium:
            return .medium
        case .large:
            return .large
        }
    }
    
    func toSecondaryButtonType() -> SecondaryButton.Size {
        switch self {
        case .small:
            return .small
        case .medium:
            return .medium
        case .large:
            return .large
        }
    }
}

enum ButtonTypeCatalog: String, Equatable, CaseIterable, Hashable, Identifiable {
    case active
    case negative
    case warning
    case disabled

    var id: String { self.rawValue }

    var label: String {
        switch self {
        case .active: return "Active"
        case .negative: return "Negative"
        case .warning: return "Warning"
        case .disabled: return "Disabled"
        }
    }

    func toPrimaryButtonType() -> PrimaryButton.ButtonType {
        switch self {
        case .active: return .active
        case .negative: return .negative
        case .warning: return .warning
        case .disabled: return .disabled
        }
    }
    
    func toSecondaryButtonType() -> SecondaryButton.ButtonType {
        switch self {
        case .active: return .active
        case .negative: return .negative
        case .warning: return .warning
        case .disabled: return .disabled
        }
    }
}

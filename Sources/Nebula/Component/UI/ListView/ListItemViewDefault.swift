//
//  ListItemViewDefault.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 31/07/25.
//

import SwiftUI

public struct ListItemViewDefault: View {
    public let config: ListItemViewConfig
    @Binding public var isCheckboxVisible: Bool
    @Binding public var checked: Bool
    
    public var body: some View {
        HStack(alignment: .center, spacing: .regular) {
            // Checkbox
            if isCheckboxVisible {
                NebulaCheckbox(
                    isChecked: $checked,
                    style: config.checkboxStyle)
            }
            // Leading
            leadingIcon(listTitle: config.title)
                .onTapGesture {
                    withAnimation(.smooth) {
                        isCheckboxVisible.toggle()
                    }
                }
            
            // Middle
            VStack(spacing: .small) {
                if let title = config.title {
                    Text(title)
                        .typography(.titleRegular)
                        .font(.headline)
                        .lineLimit(1)
                        .colorToken(.typographyPrimary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                if let subtitle = config.subtitle {
                    Text(subtitle)
                        .typography(.bodyRegular)
                        .font(.subheadline)
                        .lineLimit(2)
                        .colorToken(.typopraphySecondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                if let tertiaryTitle = config.tertiaryTitle {
                    Text(tertiaryTitle)
                        .typography(.captionRegular)
                        .font(.subheadline)
                        .lineLimit(1)
                        .colorToken(.typographyDisabled)
                        .foregroundColor(ColorToken.typographyDisabled.color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .multilineTextAlignment(.leading)
            
            // Trailing
            if config.isTrailingIconVisible {
                Image(systemName: "chevron.right")
            }
        }
    }
    
    private func getInitialTitle(title: String?) -> String? {
        guard let title, !title.isEmpty else {
            return nil
        }
        return String(title.prefix(1)).uppercased()
    }
    
    private func getInitialTitleBgColor(_ title: String?) -> Color {
        guard let title, !title.isEmpty else {
            return ColorToken.backgroundPrimary.color
        }
        let firstCharacter = String(title.prefix(1)).uppercased()
        let toAlphabetColor = AlphabethColor(rawValue: firstCharacter) ?? .letterA
        let colorToken = AlphabethColor.allCases.first { color in
            color == toAlphabetColor
        }
        return colorToken?.identityColor ?? ColorToken.backgroundPrimary.color
        
    }
    
    @ViewBuilder
    private func leadingIcon(listTitle: String?) -> some View {
        if let initialTitle = getInitialTitle(title: listTitle) {
            Circle()
                .fill(getInitialTitleBgColor(listTitle))
                .frame(width: 45, height: 45)
                .overlay {
                    Text(initialTitle)
                        .typography(.titleLarge)
                        .foregroundStyle(ColorToken.staticWhite.color)
                }
        } else {
            EmptyView()
        }
    }
}

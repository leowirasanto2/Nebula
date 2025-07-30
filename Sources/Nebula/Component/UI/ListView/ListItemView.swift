//
//  ListItemView.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 31/07/25.
//

import Foundation
import SwiftUI

public struct ListItemViewConfig {
    public var checkboxStyle: NebulaCheckboxStyle
    public var title: String?
    public var subtitle: String?
    public var tertiaryTitle: String?
    public var isLeadingIconVisible: Bool
    public var isTrailingIconVisible: Bool

    public init(
        checkboxStyle: NebulaCheckboxStyle = .primary,
        title: String? = nil,
        subtitle: String? = nil,
        tertiaryTitle: String? = nil,
        isLeadingIconVisible: Bool = true,
        isTrailingIconVisible: Bool = true
    ) {
        self.checkboxStyle = checkboxStyle
        self.title = title
        self.subtitle = subtitle
        self.tertiaryTitle = tertiaryTitle
        self.isLeadingIconVisible = isLeadingIconVisible
        self.isTrailingIconVisible = isTrailingIconVisible
    }
}

public enum ListItemType {
    case defaultItem(ListItemViewConfig)
    case customList(AnyListItemCustomComponent)
}

public struct ListItemView: View {
    @State private var isCheckboxVisible: Bool = false
    @State private var checked: Bool = false
    @State var type: ListItemType
    
    public init(type: ListItemType) {
        self.type = type
    }
    
    public var body: some View {
        switch type {
        case .defaultItem(let config):
            ListItemViewDefault(
                config: config,
                isCheckboxVisible: $isCheckboxVisible,
                checked: $checked
            )
        case .customList(let component):
            CustomListItemView(component: component)
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        // Default type
        ListItemView(
            type: .defaultItem(
                ListItemViewConfig(
                    checkboxStyle: .primary,
                    title: "Sample For Default Item View",
                    subtitle: "This is a sample subtitle for the list item view. It can be quite long and should wrap properly if it exceeds the available space.",
                    tertiaryTitle: "Open: 9:00 AM - 5:00 PM",
                    isTrailingIconVisible: true
                )
            )
        )
        
        // Custom type using the new builder
        ListItemView.custom(
            leading: {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .frame(width: 45, height: 45)
            },
            middle: {
                VStack(alignment: .leading) {
                    Text("Custom Component")
                        .font(.headline)
                    Text("Using ViewBuilder syntax")
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            },
            trailing: {
                Button(action: {}) {
                    Text("Action")
                        .foregroundColor(.blue)
                }
            }
        )
    }
    .padding()
}

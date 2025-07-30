//
//  NebulaCheckbox.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 31/07/25.
//

import SwiftUI

public enum NebulaCheckboxStyle {
    case primary
    case secondary
    case disabled
    
    public var foregroundColor: Color {
        switch self {
        case .primary:
            return ColorToken.checkboxPrimary.color
        case .secondary:
            return ColorToken.checkboxSecondary.color
        case .disabled:
            return ColorToken.checkboxDisabled.color
        }
    }
}

public struct NebulaCheckbox: View {
    @Binding var isChecked: Bool
    var style: NebulaCheckboxStyle = .primary
    
    public var body: some View {
        Button {
            isChecked.toggle()
        } label: {
            if isChecked {
                Image(systemName: "checkmark.square.fill")
                    .imageScale(.large)
                    .foregroundColor(style.foregroundColor)
            } else {
                Image(systemName: "checkmark.square")
                    .imageScale(.large)
                    .foregroundColor(ColorToken.labelDisabled.color)
            }
        }
    }
}

#Preview {
    @Previewable @State var isChecked: Bool = false
    NebulaCheckbox(isChecked: $isChecked, style: .primary)
}

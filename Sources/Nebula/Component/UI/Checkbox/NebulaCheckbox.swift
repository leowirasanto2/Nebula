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
    
    public var colorToken: ColorToken {
        switch self {
        case .primary:
            return ColorToken.buttonPrimary
        case .secondary:
            return ColorToken.buttonSecondary
        case .disabled:
            return ColorToken.buttonDisabled
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
                    .colorToken(style.colorToken)
            } else {
                Image(systemName: "checkmark.square")
                    .imageScale(.large)
                    .colorToken(ColorToken.borderPrimary)
            }
        }
    }
}

#Preview {
    @Previewable @State var isChecked: Bool = false
    VStack {
        NebulaCheckbox(isChecked: $isChecked, style: .primary)
    }
        
}

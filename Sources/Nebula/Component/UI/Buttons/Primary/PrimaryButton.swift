//
//  PrimaryButton.swift
//  MiniSAPlayground
//
//  Created by Leo Wirasanto Laia on 26/07/25.
//

import Foundation
import SwiftUI

public struct PrimaryButton: View {
    public enum ButtonType: Equatable {
        case active
        case negative
        case warning
        case disabled
        case defaultButton

        public var background: Color {
            switch self {
            case .active:
                return ColorToken.buttonPositive.color
            case .negative:
                return ColorToken.buttonNegative.color
            case .warning:
                return ColorToken.buttonWarning.color
            case .disabled:
                return ColorToken.buttonDisabled.color
            case .defaultButton:
                return ColorToken.buttonPrimary.color
            }
        }
    }

    public enum Size {
        case small
        case medium
        case large

        public var height: CGFloat {
            switch self {
            case .small: return 32
            case .medium: return 44
            case .large: return 56
            }
        }

        public var horizontalPadding: Spacing {
            switch self {
            case .small: return .small
            case .medium: return .medium
            case .large: return .large
            }
        }

        public var typography: Typography {
            switch self {
            case .small: return .bodyMedium
            case .medium: return .bodyMedium
            case .large: return .titleRegular
            }
        }
    }

    // MARK: - Properties
    let title: String
    let action: () -> Void
    let cornerRadius: CGFloat
    let size: Size
    let buttonType: ButtonType

    // MARK: - Optional Properties with Default Values
    var foregroundColor: Color = ColorToken.staticWhite.color
    var backgroundColor: Color = ColorToken.buttonPositive.color
    var isLoading = false

    // MARK: - Init
    public init(
        title: String,
        action: @escaping () -> Void,
        cornerRadius: CGFloat = 8,
        size: Size = .medium,
        buttonType: ButtonType = .defaultButton
    ) {
        self.title = title
        self.action = action
        self.cornerRadius = cornerRadius
        self.size = size
        self.buttonType = buttonType
    }

    // MARK: - Body
    public var body: some View {
        Button(action: {
            if buttonType != .disabled && !isLoading {
                action()
            }
        }) {
            HStack {
                if isLoading {
                    ProgressView()
                        .tint(ColorToken.staticWhite.color)
                } else {
                    Text(title)
                        .typography(size.typography)
                        .colorToken(.staticWhite)
                }
            }
            .frame(maxWidth: .infinity, minHeight: size.height)
            .padding(.horizontal, size.horizontalPadding)
        }
        .background(buttonType.background)
        .cornerRadius(cornerRadius)
        .disabled(buttonType == .disabled || isLoading)
    }

    // MARK: - Modifiers
    public func foregroundColor(_ color: Color) -> PrimaryButton {
        var button = self
        button.foregroundColor = color
        return button
    }

    public func backgroundColor(_ color: Color) -> PrimaryButton {
        var button = self
        button.backgroundColor = color
        return button
    }

    // MARK: - Loading State
    public func loading(_ isLoading: Bool) -> PrimaryButton {
        var button = self
        button.isLoading = isLoading
        return button
    }
}

// MARK: - Preview
struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: Spacing.default) {
            PrimaryButton(
                title: "Small - Default",
                action: {},
                size: .small,
                buttonType: .defaultButton
            )

            PrimaryButton(
                title: "Medium - Warning",
                action: {},
                size: .medium,
                buttonType: .warning
            )

            PrimaryButton(
                title: "Large Button - Default",
                action: {},
                size: .large,
                buttonType: .defaultButton
            )

            PrimaryButton(
                title: "Custom Radius - Active",
                action: {},
                cornerRadius: 20,
                size: .medium,
                buttonType: .active
            )

            PrimaryButton(
                title: "Disabled Button",
                action: {},
                size: .medium,
                buttonType: .disabled
            )

            PrimaryButton(
                title: "Loading Button",
                action: {},
                size: .medium
            )
            .loading(true)
            
            PrimaryButton(
                title: "Negative Button",
                action: {},
                size: .large,
                buttonType: .negative
            )
        }
        .padding()
    }
}

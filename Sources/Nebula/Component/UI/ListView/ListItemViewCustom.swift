//
//  ListItemViewCustom.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 31/07/25.
//

import SwiftUI

public struct ListItemCustomComponent<Leading: View, Middle: View, Trailing: View> {
    public let leadingView: Leading
    public let middleView: Middle
    public let trailingView: Trailing
    
    public init(
        @ViewBuilder leading: () -> Leading,
        @ViewBuilder middle: () -> Middle,
        @ViewBuilder trailing: () -> Trailing
    ) {
        self.leadingView = leading()
        self.middleView = middle()
        self.trailingView = trailing()
    }
}

public struct AnyListItemCustomComponent {
    private let leadingViewProvider: () -> AnyView
    private let middleViewProvider: () -> AnyView
    private let trailingViewProvider: () -> AnyView
    
    public init<Leading: View, Middle: View, Trailing: View>(
        _ component: ListItemCustomComponent<Leading, Middle, Trailing>
    ) {
        self.leadingViewProvider = { AnyView(component.leadingView) }
        self.middleViewProvider = { AnyView(component.middleView) }
        self.trailingViewProvider = { AnyView(component.trailingView) }
    }
    
    var leadingView: AnyView { leadingViewProvider() }
    var middleView: AnyView { middleViewProvider() }
    var trailingView: AnyView { trailingViewProvider() }
}

public extension ListItemView {
    static func custom<Leading: View, Middle: View, Trailing: View>(
        @ViewBuilder leading: @escaping () -> Leading,
        @ViewBuilder middle: @escaping () -> Middle,
        @ViewBuilder trailing: @escaping () -> Trailing
    ) -> ListItemView {
        let component = ListItemCustomComponent(
            leading: leading,
            middle: middle,
            trailing: trailing
        )
        return ListItemView(type: .customList(AnyListItemCustomComponent(component)))
    }
}

public struct CustomListItemView: View {
    let component: AnyListItemCustomComponent
    public var body: some View {
        HStack(alignment: .center, spacing: .regular) {
            component.leadingView
            component.middleView
            component.trailingView
        }
    }
}

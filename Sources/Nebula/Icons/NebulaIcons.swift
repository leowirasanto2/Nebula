//
//  NebulaIcons.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 21/08/25.
//

import Foundation
import SwiftUI

public enum NebulaIcons: String, CaseIterable {
    case invisible = "ic-invisible"
    case visible = "ic-visible"
    case search = "ic-search"
    case gear = "ic-gear"
    case bell = "ic-bell"
    case blocked = "ic-blocked"
    case calendarFilled = "ic-calendar-filled"
    case imageBox = "ic-imagebox"
    case send = "ic-send"
    case mail = "ic-mail"
    case burger = "ic-burger"
    case meatball = "ic-meatball"
    case filter = "ic-filter"
    case cross = "ic-cross"
    case chevronDown = "ic-chevron-down"
    case chevronUp = "ic-chevron-up"
    case chevronRight = "ic-chevron-right"
    case chevronLeft = "ic-chevron-left"
    case arrowDown = "ic-arrow-down"
    case arrowUp = "ic-arrow-up"
    case arrowRight = "ic-arrow-right"
    case arrowLeft = "ic-arrow-left"
}

public extension NebulaIcons {
    var image: Image {
        Image(self.rawValue, bundle: .module)
    }
}

public extension NebulaIcons {
    var uiImage: UIImage? {
        UIImage(named: self.rawValue, in: .module, compatibleWith: nil)
    }
}

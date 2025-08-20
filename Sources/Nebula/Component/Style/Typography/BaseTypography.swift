//
//  BaseTypography.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 20/08/25.
//

import Foundation
import SwiftUI

public enum TypographySize: CGFloat, CaseIterable {
    case extraSmall = 12
    case small = 14
    case medium = 16
    case large = 18
    case extraLarge = 20
    case extraLarge2 = 24
    case extraLarge3 = 32
    case extraLarge4 = 40
}

public enum TypographyWeight: String, CaseIterable {
    case light
    case regular
    case bold
}

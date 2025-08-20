//
//  Font+Nebula.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 20/08/25.
//

import SwiftUI

extension Font {
    
    public struct NebulaFonts {
        
        /// Returns a fixed-size font of the specified style.
        public static func fixed(_ style: NebulaFont, size: TypographySize) -> Font {
            return Font.custom(style.name, fixedSize: size.rawValue)
        }
        
        /// Returns a relative-size font of the specified style.
        public static func relative(_ style: NebulaFont, size: TypographySize, relativeTo
                                    textStyle: Font.TextStyle) -> Font {
            return Font.custom(style.name, size: size.rawValue, relativeTo: textStyle)
        }
    }
}

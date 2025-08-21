//
//  Elevation.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 21/08/25.
//

import Foundation
import SwiftUI

public enum ElevationLevel: Int, CaseIterable {
    case normal
    case medium
    case large
    
    public var shadow: (color: Color, radius: CGFloat) {
        switch self {
        case .normal:
            return (ColorToken.buttonDisabled.color.opacity(0.6), 4)
        case .medium:
            return (ColorToken.buttonDisabled.color.opacity(0.9), 8)
        case .large:
            return (ColorToken.buttonDisabled.color, 12)
        }
    }
}

public extension View {
    func elevate(_ level: ElevationLevel = .normal) -> some View {
        let shadow = level.shadow
        return self.shadow(color: shadow.color,
                           radius: shadow.radius,
                           x: 0,
                           y: 0)
    }
}

private struct ElevationDemo: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Normal Elevation")
                .padding()
                .background(ColorToken.staticWhite.color)
                .elevate(.normal)
            
            Text("Medium Elevation")
                .padding()
                .background(ColorToken.staticWhite.color)
                .elevate(.medium)
            
            Text("Large Elevation")
                .padding()
                .background(ColorToken.staticWhite.color)
                .elevate(.large)
        }
        .padding()
    }
}

#Preview {
    ElevationDemo()
}

//
//  NebulaFont.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 20/08/25.
//

import SwiftUI

public struct NebulaFont: Sendable {
    public let name: String
    
    private init(named name: String) {
        self.name = name
        do {
            try registerFont(named: name)
        } catch {
            let reason = error.localizedDescription
            fatalError("Failed to register font: \(reason)")
        }
    }
    
    public static let light = NebulaFont(named: "Geist-Light")
    public static let thin = NebulaFont(named: "Geist-Thin")
    public static let medium = NebulaFont(named: "Geist-Medium")
    public static let semibold = NebulaFont(named: "Geist-SemiBold")
    public static let regular = NebulaFont(named: "Geist-Regular")
    public static let bold = NebulaFont(named: "Geist-Bold")
}

//
//  NebulaImages.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 21/08/25.
//

import SwiftUI
import UIKit

public enum NebulaImages: String, CaseIterable {
    case placeholder = "img-placeholder"
}

public extension NebulaImages {
    var image: Image {
        Image(self.rawValue, bundle: .module)
    }
}

public extension NebulaImages {
    var uiImage: UIImage? {
        UIImage(named: self.rawValue, in: .module, compatibleWith: nil)
    }
}

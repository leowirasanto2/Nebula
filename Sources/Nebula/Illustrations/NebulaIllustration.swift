//
//  NebulaIllustration.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 26/07/25.
//

import SwiftUI
import UIKit

public enum NebulaIllustration: String, CaseIterable {
    case askingQuestion = "illustration-asking-question"
    case businessDeal = "illustration-business-deal"
    case bye = "illustration-bye"
    case emptyStateNoUserFound = "illustration-empty-state-no-user-found"
    case emptyCart = "illustration-emptystates-empty-cart"
    case insurance = "illustration-insurance"
    case noEmail = "illustration-no-email"
    case paymentProcessed = "illustration-payment-processed"
    case phoneHotspot = "illustration-phone-hotspot"
    case running = "illustration-running"
    case teamPeople = "illustration-team-people"
    case uploading = "illustration-uploading"
    case virtualReality = "illustration-virtual-reality"
    case wireframe = "illustration-wireframe"
}

public extension NebulaIllustration {
    var image: Image {
        Image(self.rawValue, bundle: .module)
    }
}

public extension NebulaIllustration {
    var uiImage: UIImage? {
        UIImage(named: self.rawValue, in: .module, compatibleWith: nil)
    }
}

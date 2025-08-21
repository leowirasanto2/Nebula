//
//  SwiftUIView.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 21/08/25.
//

import SwiftUI

public enum CarouselType: Sendable, Equatable, CaseIterable {
    case rectangled
    case squared
}

public struct BannerModel: Sendable, Equatable {
    public let id: String
    public let imageUrl: String
    public let deeplinkUrl: String
}

public struct BannerCarouselConfig: Sendable, Equatable {
    public let type: CarouselType
    public let items: [BannerModel]
}

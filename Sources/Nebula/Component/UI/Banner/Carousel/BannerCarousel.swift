//
//  BannerCarousel.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 21/08/25.
//

import SwiftUI

public struct BannerCarousel: View {
    public var model: BannerCarouselConfig
    @State private var currentIndex: Int = 0
    
    private var indicatorBaseWidth: CGFloat {
        switch model.type {
        case .rectangled:
            return RectangledBannerView.size.width - 48
        case .squared:
            return SquaredBannerView.size.width - 32
        }
    }
    
    private var bannerSize: CGSize {
        switch model.type {
        case .rectangled:
            return RectangledBannerView.size
        case .squared:
            return SquaredBannerView.size
        }
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            TabView(selection: $currentIndex) {
                ForEach(Array(model.items.enumerated()), id: \.element.id) { index, item in
                    RectangledBannerView(model: item, isSingleBanner: false)
                        .tag(index)
                }
            }
            .frame(width: bannerSize.width, height: bannerSize.height)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .elevate()
            
            indicatorView
        }
    }
    
    @ViewBuilder
    private var indicatorView: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8)
                .fill(ColorToken.backgroundSecondary.color)
                .frame(width: indicatorBaseWidth, height: 4)
            
            RoundedRectangle(cornerRadius: 8)
                .fill(ColorToken.backgroundTertiary.color)
                .frame(
                    width: CGFloat(currentIndex + 1) / CGFloat(model.items.count) * indicatorBaseWidth,
                    height: 4)
                .animation(.easeInOut(duration: 0.3), value: currentIndex)
        }
    }
}

#Preview {
    BannerCarousel(model: .init(type: .rectangled, items: BannerModel.dummyBanners))
}

extension BannerModel {
    static let dummyBanners: [BannerModel] = [
        BannerModel(
            id: UUID().uuidString,
            imageUrl: "https://gizmologi.id/wp-content/uploads/2024/08/Nothing-Phone-2a-Plus-101-860x484.jpg",
            deeplinkUrl: "https://www.google.com"
        ),
        BannerModel(
            id: UUID().uuidString,
            imageUrl: "https://blogassets.airtel.in/wp-content/uploads/2024/12/Nothing-Phone.jpg",
            deeplinkUrl: "https://www.google.com"
        ),
        BannerModel(
            id: UUID().uuidString,
            imageUrl: "https://www.tablety.pl/wp-content/uploads/2024/06/nothing-phone-3.jpg",
            deeplinkUrl: "https://www.google.com"
        )
    ]
}

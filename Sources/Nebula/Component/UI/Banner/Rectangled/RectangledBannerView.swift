//
//  RectangledBannerView.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 21/08/25.
//

import SwiftUI
import Kingfisher

public struct RectangledBannerView: View {
    public static let size: CGSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 150)
    
    private let model: BannerModel
    private let isSingleBanner: Bool
    
    init(model: BannerModel, isSingleBanner: Bool = true) {
        self.model = model
        self.isSingleBanner = isSingleBanner
    }
    
    public var body: some View {
        if isSingleBanner {
            contentView
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .elevate()
        } else {
            contentView
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        KFImage(URL(string: model.imageUrl))
            .resizable()
            .scaledToFill()
            .frame(width: Self.size.width, height: Self.size.height)
    }
}

#Preview {
    RectangledBannerView(model: BannerModel(id: "abc", imageUrl: "https://awsimages.detik.net.id/visual/2025/07/02/nothing-phone-3-1751430735556_169.png?w=480&q=90", deeplinkUrl: "https://nebula"))
}

//
//  CardView.swift
//  Nebula
//
//  Created by Leo Wirasanto Laia on 21/08/25.
//

import SwiftUI

public struct CardViewConfig: Equatable {
    public let title: String
    public let imageUrl: String?
    public let shortNote: String?
}

public struct CardView<LeadingSubtitleView: View, TrailingSubtitleView: View>: View {
    private let config: CardViewConfig
    private let leadingSubtitleView: LeadingSubtitleView
    private let trailingSubtitleView: TrailingSubtitleView
    public static var size: CGSize {
        CGSize(width: 240, height: 200)
    }
    
    public init(
        config: CardViewConfig,
        @ViewBuilder leadingSubtitleView: () -> LeadingSubtitleView,
        @ViewBuilder trailingSubtitleView: () -> TrailingSubtitleView
    ) {
        self.config = config
        self.leadingSubtitleView = leadingSubtitleView()
        self.trailingSubtitleView = trailingSubtitleView()
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: .small) {
            Group {
                AsyncImage(url: URL(string: config.imageUrl ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, minHeight: Self.size.height / 2, maxHeight: Self.size.height / 2, alignment: .top)
                } placeholder: {
                    NebulaImages.placeholder.image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, minHeight: Self.size.height / 2, maxHeight: Self.size.height / 2, alignment: .top)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(spacing: .extraSmall){
                Text(config.title)
                    .typography(.titleRegular)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(alignment: .center, spacing: .extraSmall) {
                    leadingSubtitleView
                    trailingSubtitleView
                }
                
                if let shortNote = config.shortNote {
                    Text(shortNote)
                        .typography(.captionRegular)
                        .lineLimit(2)
                        .colorToken(.borderWarning)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: Self.size.height / 2, alignment: .top)
            .padding(.bottom, 8)
            .padding(.horizontal, .small)
        }
        .frame(width: Self.size.width, height: Self.size.height)
        .background(ColorToken.backgroundPrimary.color)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .elevate()
    }
}

#Preview {
    CardView(
        config: .init(
            title: "Nothing Phone 2",
            imageUrl: "https://awsimages.detik.net.id/visual/2025/07/02/nothing-phone-3-1751430735556_169.png?w=480&q=90",
            shortNote: "Pre order now!"
        )) {
            VStack {
                Text("Leading Subtitle")
                    .typography(.captionRegular)
                    .lineLimit(1)
                    .colorToken(.typographyPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("leading desc")
                    .typography(.captionSmall)
                    .lineLimit(1)
                    .colorToken(.typopraphySecondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        } trailingSubtitleView: {
            VStack {
                Text("Trailing Subtitle")
                    .typography(.captionRegular)
                    .lineLimit(1)
                    .colorToken(.typographyPrimary)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text("trailing desc")
                    .typography(.captionSmall)
                    .lineLimit(1)
                    .colorToken(.typopraphySecondary)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
}

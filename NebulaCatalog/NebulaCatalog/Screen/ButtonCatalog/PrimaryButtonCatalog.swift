//
//  PrimaryButtonCatalog.swift
//  NebulaCatalog
//
//  Created by Leo Wirasanto Laia on 27/07/25.
//

import Foundation
import Nebula
import SwiftUI

struct PrimaryButtonCatalog: View {
    @EnvironmentObject var model: ButtonCatalogViewModel
    
    var body: some View {
        VStack {
            PrimaryButton(
                title: "Primary Button Field",
                action: {
                    
                },
                cornerRadius: model.slider,
                size: model.buttonSize.toPrimaryButtonSize(),
                buttonType: model.buttonType.toPrimaryButtonType()
            )
            .loading(model.isLoading)
        }
        .frame(minHeight: 100)
        .paddingHorizontal(.regular)
        .border(ColorToken.borderDefault.color)
        .paddingHorizontal(.regular)
    }
}

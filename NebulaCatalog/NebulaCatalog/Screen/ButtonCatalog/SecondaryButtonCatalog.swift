//
//  SecondaryButtonCatalog.swift
//  NebulaCatalog
//
//  Created by Leo Wirasanto Laia on 27/07/25.
//

import Foundation
import Nebula
import SwiftUI

struct SecondaryButtonCatalog: View {
    @EnvironmentObject var model: ButtonCatalogViewModel
    
    var body: some View {
        VStack {
            SecondaryButton(
                title: "Secondary Button Field",
                action: {
                    
                },
                cornerRadius: model.slider,
                size: model.buttonSize.toSecondaryButtonType(),
                buttonType: model.buttonType.toSecondaryButtonType()
            )
            .loading(model.isLoading)
        }
        .frame(minHeight: 100)
        .paddingHorizontal(.regular)
        .border(ColorToken.borderDefault.color)
        .paddingHorizontal(.regular)
    }
}

//
//  CatalogListPage.swift
//  NebulaCatalog
//
//  Created by Leo Wirasanto Laia on 27/07/25.
//

import SwiftUI
import Nebula

struct CatalogListPage: View {
    @EnvironmentObject var model: CatalogListScreenViewModel
    var body: some View {
        VStack(spacing: Spacing.medium) {
            ScrollView {
                ForEach(model.sections, id: \.id) { section in
                    VStack(alignment: .leading) {
                        
                        Text(section.title)
                            .typography(.titleRegular)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: Spacing.regular) {
                            ForEach(section.components, id: \.title) { component in
                                Text("\(component.title)")
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                    .padding(.top, Spacing.regular)
                }
            }
        }
    }
}

#Preview {
    CatalogListPage()
        .environmentObject(CatalogListScreenViewModel())
}

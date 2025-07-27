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
        VStack {
            ScrollView {
                if !model.isSearching {
                    HStack(spacing: .medium) {
                        VStack(alignment: .leading) {
                            Text("Nebula Catalog")
                                .font(.title)
                                .fontWeight(.medium)
                            Text("v1.0.1")
                                .typography(.captionRegular)
                                .colorToken(.labelDisabled)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "magnifyingglass")
                            .onTapGesture {
                                model.setSearchState(true)
                            }
                    }
                    .paddingHorizontal(.regular)
                    .paddingVertical(.regular)
                } else {
                    MSAInputField(
                        text: $model.searchText,
                        placeholder: "Search for component",
                        inputType: .text,
                        cornerRadius: 8
                    )
                    .paddingHorizontal(.regular)
                }
                
                if model.isSearching && !model.searchResult.isEmpty {
                    searchedComponent
                } else {
                    allComponents
                }
            }
        }
    }
    
    @ViewBuilder
    private func listItem(component: CatalogComponents) -> some View {
        HStack {
            Text(component.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .typography(.subtitle)
            Image(systemName: "chevron.right")
        }
        .padding(.regular)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(radius: 1)
        .onTapGesture {
            model.navigateTo(component)
        }
    }
    
    @ViewBuilder
    private var allComponents: some View {
        ForEach(model.sections, id: \.id) { section in
            VStack(alignment: .leading) {
                Text(section.title)
                    .typography(.titleRegular)
                    .colorToken(.labelDefault)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: Spacing.regular) {
                    ForEach(section.components, id: \.title) {
                        listItem(component: $0)
                    }
                }
                .padding(.top, 4)
            }
            .paddingVertical(.small)
            .paddingHorizontal(.regular)
        }
    }
    
    @ViewBuilder
    private var searchedComponent: some View {
        ForEach(model.searchResult, id: \.id) { section in
            VStack(alignment: .leading) {
                
                Text(section.title)
                    .typography(.titleRegular)
                    .colorToken(.labelDefault)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: Spacing.regular) {
                    ForEach(section.components, id: \.title) {
                        listItem(component: $0)
                    }
                }
                .padding(.top, 4)
            }
            .paddingVertical(.small)
            .paddingHorizontal(.regular)
        }
    }
}

#Preview {
    CatalogListPage()
        .environmentObject(CatalogListScreenViewModel(path: .constant(NavigationPath())))
}

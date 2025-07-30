//
//  CatalogListScreenViewModel.swift
//  NebulaCatalog
//
//  Created by Leo Wirasanto Laia on 27/07/25.
//

import Combine
import Foundation
import SwiftUI

final class CatalogListScreenViewModel: ObservableObject {
    @Published var sections: [CatalogSection] = []
    @Published var searchText = ""
    @Published var searchResult: [CatalogSection] = []
    @Published var isSearching = false
    @Binding var path: NavigationPath
    private var searchCancellable: AnyCancellable?
    
    init(path: Binding<NavigationPath>) {
        self._path = path
        generateSections()
        observeSearchText()
    }
    
    deinit {
        searchCancellable = nil
    }
    
    func generateSections() {
        sections = CatalogSection.data
    }
    
    func setSearchState(_ searching: Bool) {
        withAnimation {
            isSearching = searching
        }
    }
    
    func observeSearchText() {
        searchCancellable = $searchText
            .debounce(for: .milliseconds(150), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.setSearchState(!self.searchText.isEmpty)
                
                if self.isSearching {
                    self.searchResult = sections.compactMap { section in
                        let containedComponents = section.components.filter({ $0.title.contains(self.searchText )})
                        if !containedComponents.isEmpty {
                            return CatalogSection(
                                id: section.id,
                                title: section.title,
                                components: containedComponents
                            )
                        } else {
                            return nil
                        }
                    }
                } else {
                    self.searchResult = []
                }
            }
    }
    
    func navigateTo(_ selectedCatalog: CatalogComponents) {
        let destination = selectedCatalog.toScreens()
        path.append(destination)
    }
}

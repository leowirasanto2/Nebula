//
//  CatalogListScreenViewModel.swift
//  NebulaCatalog
//
//  Created by Leo Wirasanto Laia on 27/07/25.
//

import Combine

final class CatalogListScreenViewModel: ObservableObject {
    @Published var sections: [CatalogSection] = []
    
    init() {
        generateSections()
    }
    
    func generateSections() {
        sections = CatalogSection.data
    }
}

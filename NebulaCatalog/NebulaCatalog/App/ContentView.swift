//
//  ContentView.swift
//  NebulaCatalog
//
//  Created by Leo Wirasanto Laia on 27/07/25.
//

import SwiftUI
import Nebula

struct ContentView: View {
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            CatalogListPage()
                .environmentObject(CatalogListScreenViewModel(
                    path: $path
                ))
                .navigationDestination(for: Screens.self) { destination in
                    switch destination {
                    case .buttonsDetail:
                        ButtonCatalogContainer()
                            .environmentObject(ButtonCatalogViewModel())
                    default:
                        VStack {
                            NebulaIllustration.virtualReality.image
                            Text("Still in progress")
                                .typography(.bodyRegular)
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}

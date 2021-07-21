//
//  ContentView.swift
//  ResolverTestProject
//
//  Created by Alexander Rivera on 19/7/21.
//

import SwiftUI
import Resolver

struct ContentView: View {
    
    @StateObject var catViewModel: CatViewModel = CatViewModel(catService: Resolver.resolve())
    
    var body: some View {
        NavigationView {
            List(catViewModel.catBreeds, id: \.id) { catBreed in
                CatCellView(catBreed: catBreed)
            }
            .navigationTitle("Cats!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

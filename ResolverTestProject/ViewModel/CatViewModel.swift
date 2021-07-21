//
//  CatViewModel.swift
//  ResolverTestProject
//
//  Created by Alexander Rivera on 19/7/21.
//

import Foundation
import Combine
import Resolver

class CatViewModel: ObservableObject {
    
    @Published var catBreeds: [Cat] = []
    var catService: Service!
    private var setCancellables: Set<AnyCancellable> = []
    
    init() {
        getCats()
    }
    
    func getCats() {
        catService.requestCats()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.catBreeds = value.data
            })
            .store(in: &setCancellables)
    }
    
}

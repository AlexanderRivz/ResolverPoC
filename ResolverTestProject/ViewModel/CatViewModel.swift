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
    private var setCancellables: Set<AnyCancellable> = []
    
    init() {
        getCats(withCatService: Resolver.resolve())
    }
    
    func getCats(withCatService catService: Service) {
        catService.requestCats(withUrlComponents: Resolver.resolve(), withRequester: Resolver.resolve())
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

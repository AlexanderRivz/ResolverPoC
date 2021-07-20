//
//  CatService.swift
//  ResolverTestProject
//
//  Created by Alexander Rivera on 19/7/21.
//

import Foundation
import Combine

class CatService: Service {
    
    private var networkRequester: Requester
    
    init(networkRequester: Requester = NetworkRequester()) {
        self.networkRequester = networkRequester
    }
    
    func requestCats() -> AnyPublisher<ResultModel, Error> {
        networkRequester.fetch(formUrl: URL(string: "https://catfact.ninja/breeds")!)
            .decode(type: ResultModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}

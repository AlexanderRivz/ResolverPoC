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
    private var urlComponents: Components
    
    init(networkRequester: Requester = NetworkRequester(), urlComponents: Components = URLComponentsService()) {
        self.networkRequester = networkRequester
        self.urlComponents = urlComponents
    }
    
    func requestCats() -> AnyPublisher<ResultModel, Error> {
        guard let url = urlComponents.makeCryptoCurrencyComponents().url else { return Fail(error: URLError(.badURL)).eraseToAnyPublisher() }
        return networkRequester.fetch(formUrl: url)
            .decode(type: ResultModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}

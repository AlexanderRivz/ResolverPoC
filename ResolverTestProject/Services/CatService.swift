//
//  CatService.swift
//  ResolverTestProject
//
//  Created by Alexander Rivera on 19/7/21.
//

import Foundation
import Combine
import Resolver

class CatService: Service {
    
    func requestCats(
        withUrlComponents urlComponents: Components,
        withRequester networkRequester: Requester
    ) -> AnyPublisher<ResultModel, Error> {
        guard let url = urlComponents.makeCryptoCurrencyComponents().url else { return Fail(error: URLError(.badURL)).eraseToAnyPublisher() }
        return networkRequester.fetch(formUrl: url, withSession: Resolver.resolve())
            .decode(type: ResultModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}

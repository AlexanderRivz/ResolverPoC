//
//  NetworkRequester.swift
//  ResolverTestProject
//
//  Created by Alexander Rivera on 19/7/21.
//

import Foundation
import Combine
import Resolver

class NetworkRequester: Requester {
    
    lazy private var session: URLSession = getSession()
    
    func fetch(formUrl url: URL) -> AnyPublisher<Data, URLError> {
        session.dataTaskPublisher(for: url)
            .map(\.data)
            .eraseToAnyPublisher()
    }
    
}

extension NetworkRequester: Resolving {
    
    func getSession() -> URLSession { return resolver.resolve() }
    
}

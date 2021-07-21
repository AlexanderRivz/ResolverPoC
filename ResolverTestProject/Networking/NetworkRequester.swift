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
    
    var session: URLSession!
    
    func fetch(formUrl url: URL) -> AnyPublisher<Data, URLError> {
        session.dataTaskPublisher(for: url)
            .map(\.data)
            .eraseToAnyPublisher()
    }
    
}

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
    
    func fetch(formUrl url: URL, withSession session: URLSession) -> AnyPublisher<Data, URLError> {
        session.dataTaskPublisher(for: url)
            .map(\.data)
            .eraseToAnyPublisher()
    }
    
}

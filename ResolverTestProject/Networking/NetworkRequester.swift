//
//  NetworkRequester.swift
//  ResolverTestProject
//
//  Created by Alexander Rivera on 19/7/21.
//

import Foundation
import Combine

class NetworkRequester: Requester {
    
    private var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetch(formUrl url: URL) -> AnyPublisher<Data, URLError> {
        session.dataTaskPublisher(for: url)
            .map(\.data)
            .eraseToAnyPublisher()
    }
    
}

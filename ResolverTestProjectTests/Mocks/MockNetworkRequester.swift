//
//  MockNetworkRequester.swift
//  ResolverTestProjectTests
//
//  Created by Alexander Rivera on 26/7/21.
//

import Foundation
import Combine
@testable import ResolverTestProject

class MockNetworkRequester: Requester {
    
    var result: AnyPublisher<Data, URLError>?
    
    func fetch(formUrl url: URL) -> AnyPublisher<Data, URLError> {
        guard let result = result else {
            fatalError("Result is nil")
        }
        return result
    }
    
}

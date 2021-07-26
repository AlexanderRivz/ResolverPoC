//
//  Resolver+XCTest.swift
//  ResolverTestProjectTests
//
//  Created by Alexander Rivera on 26/7/21.
//

import Foundation
import Resolver
@testable import ResolverTestProject

extension Resolver {
    
    static var mock = Resolver(parent: .main)
    
    static func registerMockServices() {
        root = Resolver.mock
        defaultScope = .application
        Resolver.mock.register { MockNetworkRequester() }
            .implements(Requester.self)
        Resolver.mock.register { MockURLComponentsService() }
            .implements(Components.self)
        Resolver.mock.register { MockCatService() }
            .implements(Service.self)
        Resolver.mock.register { MockURLSession(data: FakeResponseData.correctCatData, response: FakeResponseData.response200k, error: nil) }
            .implements(URLSession.self)
    }
    
}

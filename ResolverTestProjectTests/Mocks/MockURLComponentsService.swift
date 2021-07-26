//
//  MockURLComponentsService.swift
//  ResolverTestProjectTests
//
//  Created by Alexander Rivera on 26/7/21.
//

import Foundation
@testable import ResolverTestProject

struct MockURLComponentsService: Components {
    func makeCryptoCurrencyComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "testurl"
        components.path = "/test"

        return components
    }
}

//
//  URLComponentsService.swift
//  ResolverTestProject
//
//  Created by Alexander Rivera on 19/7/21.
//

import Foundation

struct URLComponentsService: Components {
    func makeCryptoCurrencyComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "catfact.ninja"
        components.path = "/breeds"

        return components
    }
}

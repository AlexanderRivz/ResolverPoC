//
//  AppDelegate+Injection.swift
//  ResolverTestProject
//
//  Created by Alexander Rivera on 20/7/21.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        defaultScope = .graph
        register { CatService() }
            .implements(Service.self)
        register { NetworkRequester() }
            .implements(Requester.self)
        register { URLComponentsService() }
            .implements(Components.self)
        register { URLSession(configuration: .default) }
    }
    
}

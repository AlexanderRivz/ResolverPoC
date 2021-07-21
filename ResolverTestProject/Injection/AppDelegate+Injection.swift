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
        registerAllModels()
        registeringServices()
    }
    
}

extension Resolver {
    
    public static func registerAllModels() {
        register { CatViewModel() }
                .resolveProperties { (resolver, model) in
                    model.catService = resolver.optional()
                }
        register { CatService() }
                .resolveProperties { (resolver, model) in
                    model.networkRequester = resolver.optional()
                    model.urlComponents = resolver.optional()
                }
        register { NetworkRequester() }
                .resolveProperties { (resolver, model) in
                    model.session = resolver.optional()
                }
    }
    
}

extension Resolver {
    
    public static func registeringServices() {
        register { CatService() as Service }
        register { NetworkRequester() as Requester }
        register { URLComponentsService() as Components }
        register { URLSession(configuration: .default) }
    }
    
}

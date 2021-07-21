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
        register { CatViewModel(catService: resolve()) }
        register { CatService(networkRequester: resolve(), urlComponents: resolve()) as Service }
        register { NetworkRequester(session: resolve()) as Requester }
        register { URLComponentsService() as Components }
        register { URLSession(configuration: .default) }
    }
    
}

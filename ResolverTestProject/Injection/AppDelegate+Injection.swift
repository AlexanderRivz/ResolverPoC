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
        register { CatViewModel() }
        register { CatService() as Service }
        register { NetworkRequester() as Requester }
        register { URLComponentsService() as Components }
        register { URLSession(configuration: .default) }
    }
    
}

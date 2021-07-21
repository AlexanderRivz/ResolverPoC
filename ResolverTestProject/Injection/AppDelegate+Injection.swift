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
        register { URLComponentsService() /*as Components*/ }
            .implements(Components.self)
        register { URLSession(configuration: .default) }
        
        register { CatViewModel() }
            .resolveProperties { (_, model) in
                model.catService = optional()
                
            }
        
        register { CatService() }
            .resolveProperties { (_, model) in
                model.networkRequester = optional()
                model.urlComponents = optional()
            }
            .implements(Service.self)
        
        register { NetworkRequester() }
            .resolveProperties { (_, model) in
                model.session = optional()
            }
            .implements(Requester.self)
    }
    
}

//
//  Service.swift
//  ResolverTestProject
//
//  Created by Alexander Rivera on 19/7/21.
//

import Foundation
import Combine

protocol Service {
    
    func requestCats(
        withUrlComponents urlComponents: Components,
        withRequester networkRequester: Requester
    ) -> AnyPublisher<ResultModel, Error>
    
}

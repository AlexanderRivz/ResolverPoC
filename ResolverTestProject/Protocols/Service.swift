//
//  Service.swift
//  ResolverTestProject
//
//  Created by Alexander Rivera on 19/7/21.
//

import Foundation
import Combine

protocol Service {
    
    func requestCats() -> AnyPublisher<ResultModel, Error>
    
}

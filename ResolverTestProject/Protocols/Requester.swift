//
//  Requester.swift
//  ResolverTestProject
//
//  Created by Alexander Rivera on 19/7/21.
//

import Foundation
import Combine

protocol Requester {
    
    func fetch(formUrl url: URL, withSession session: URLSession) -> AnyPublisher<Data, URLError>
    
}

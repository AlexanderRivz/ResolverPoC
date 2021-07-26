//
//  Cat.swift
//  ResolverTestProject
//
//  Created by Alexander Rivera on 19/7/21.
//

import Foundation

struct Cat: Codable, Identifiable, Equatable {
    
    let breed: String
    let country: String
    let origin: String
    let coat: String
    let pattern: String
    let id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case breed
        case country
        case origin
        case coat
        case pattern
    }

}

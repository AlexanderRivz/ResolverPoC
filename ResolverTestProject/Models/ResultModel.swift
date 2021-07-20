//
//  ResultModel.swift
//  ResolverTestProject
//
//  Created by Alexander Rivera on 19/7/21.
//

import Foundation

struct ResultModel: Codable, Identifiable {
    
    let currentPage: Int
    let data: [Cat]
    let firstPageUrl: String
    let from: Int
    let lastPage: Int
    let lastPageUrl: String
    let links: [Links]
    let nextPageUrl: String
    let path: String
    let perPage: Int
    let prevPageUrl: String?
    let too: Int
    let total: Int
    let id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageUrl = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageUrl = "last_page_url"
        case links
        case nextPageUrl = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageUrl = "prev_page_url"
        case too = "to"
        case total
    }
    
}


struct Links: Codable, Identifiable {
    
    let url: String?
    let label: String
    let active: Bool
    let id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case url
        case label
        case active
    }
}

//
//  FakeResponseData.swift
//  ResolverTestProjectTests
//
//  Created by Alexander Rivera on 26/7/21.
//

import Foundation

class FakeResponseData {
    
    static let response200k = HTTPURLResponse(url: URL(string: "https://test.tmdb.request-token")!,
                                              statusCode: 200,
                                              httpVersion: nil,
                                              headerFields: nil)!
    
    static let responseKO = HTTPURLResponse(url: URL(string: "https://test.tmdb.bad-response")!,
                                            statusCode: 500,
                                            httpVersion: nil,
                                            headerFields: nil)!

    static var correctCatData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let fakeJsonURL = bundle.url(forResource: "catRequest", withExtension: "json")
        let fakeJsonData = try! Data(contentsOf: fakeJsonURL!)
        return fakeJsonData
    }
        
}

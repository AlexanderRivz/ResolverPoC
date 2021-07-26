//
//  MockCatService.swift
//  ResolverTestProjectTests
//
//  Created by Alexander Rivera on 26/7/21.
//

import Foundation
import Combine
@testable import ResolverTestProject

class MockCatService: Service {
    
    func requestCats() -> AnyPublisher<ResultModel, Error> {
        let resultModel = ResultModel(
            currentPage: 1,
            data: [Cat(
                    breed: "Domestic Cat",
                    country: "El Salvador",
                    origin: "El Salvador",
                    coat: "Short Hair",
                    pattern: "Stripes")],
            firstPageUrl: "pageurl.com",
            from: 1,
            lastPage: 1,
            lastPageUrl: "lastpageurl.com",
            links: [Links(
                        url: nil,
                        label: "",
                        active: false)],
            nextPageUrl: "nextpageurl.com",
            path: "/cat",
            perPage: 1,
            prevPageUrl: nil,
            too: 1,
            total: 1)
        return Just(resultModel).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
    
}

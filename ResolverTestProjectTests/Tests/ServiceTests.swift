//
//  ServiceTests.swift
//  ResolverTestProjectTests
//
//  Created by Alexander Rivera on 26/7/21.
//

import XCTest
import Resolver
import Combine
@testable import ResolverTestProject

class ServiceTests: XCTestCase {

    @LazyInjected var networkRequester: MockNetworkRequester
    @LazyInjected var urlComponents: MockURLComponentsService
    var service: Service!
    var setCancellables: Set<AnyCancellable>!
    var expectation: XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        //Given SetUp
        Resolver.registerMockServices()
        service = CatService()
        expectation = XCTestExpectation(description: "Wait for data")
        setCancellables = Set<AnyCancellable>()

    }

    override func tearDown() {
        //Tear Down
        service = nil
        setCancellables = nil
        expectation = nil
        super.tearDown()
    }
    
    func testFetch() {
        //Given
        let mockData = getData()
        var result: ResultModel!
        networkRequester.result = Just(mockData).setFailureType(to: URLError.self).eraseToAnyPublisher()
        
        //When
        service.requestCats().sink(receiveCompletion: { completion in
            switch completion {
            case .failure:
                XCTFail()
            case .finished:
                break
            }
        }, receiveValue: { value in
            result = value
            self.expectation.fulfill()
        })
        .store(in: &setCancellables)
        
        //Then
        wait(for: [expectation], timeout: 3.0)
        XCTAssertEqual(result.data.first?.breed, "Domestic Cat")
        XCTAssertEqual(result.currentPage, 1)
        XCTAssertEqual(result.data.first?.origin, "El Salvador")
        XCTAssertEqual(result.data.first?.coat, "Short Hair")
    }
}

extension ServiceTests {
    private func getData() -> Data {
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
        let encodedData = try! JSONEncoder().encode(resultModel)
        return encodedData
    }
}



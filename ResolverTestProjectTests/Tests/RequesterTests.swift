//
//  RequesterTests.swift
//  ResolverTestProjectTests
//
//  Created by Alexander Rivera on 26/7/21.
//

import XCTest
import Combine
import Resolver
@testable import ResolverTestProject

class RequesterTests: XCTestCase {

    @LazyInjected var session: MockURLSession
    var networkRequester: Requester!
    var setCancellables: Set<AnyCancellable>!
    var expectation: XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        // Given Set Up
        Resolver.registerMockServices()
        networkRequester = NetworkRequester()
        expectation = XCTestExpectation(description: "Wait for data")
        setCancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        // Tear Down
        networkRequester = nil
        expectation = nil
        setCancellables = nil
        super.tearDown()
    }
    
    func testFetch() {
        // Given
        let url = URL(string: "www.thisisatesturl.com")!
        var receivedValue: Data!
        
        // When
        networkRequester.fetch(formUrl: url)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    XCTFail()
                case .finished:
                    break
                }
            }, receiveValue: { value in
                receivedValue = value
                self.expectation.fulfill()
            })
            .store(in: &setCancellables)
        
//        networkRequester.fetch(formUrl: url)
//            .decode(type: ResultModel.self, decoder: JSONDecoder())
//            .assertNoFailure()
//            .sink(receiveValue: { value in
//                print(value)
//            })
//            .store(in: &setCancellables)
        
        // Then
        wait(for: [expectation], timeout: 3)
        XCTAssertNotNil(receivedValue)
    }

}

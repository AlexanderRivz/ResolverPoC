//
//  ViewModelTests.swift
//  ResolverTestProjectTests
//
//  Created by Alexander Rivera on 26/7/21.
//

import XCTest
import Resolver
import Combine
@testable import ResolverTestProject

class ViewModelTests: XCTestCase {

    @LazyInjected var catService: MockCatService
    var catViewModel: CatViewModel!
    var setCancellables: Set<AnyCancellable>!
    var expectation: XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        // Given Set Up
        Resolver.registerMockServices()
        catViewModel = CatViewModel()
        expectation = XCTestExpectation(description: "Wait for data")
        setCancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        // Tear Down
        catViewModel = nil
        expectation = nil
        setCancellables = nil
        super.tearDown()
    }
    
    func testGetCats() {
        // Given
        let expectedValue = [Cat(
                                breed: "Domestic Cat",
                                country: "El Salvador",
                                origin: "El Salvador",
                                coat: "Short Hair",
                                pattern: "Stripes")]
        
        // When
        catViewModel.getCats()
        
        // Then
        catViewModel.$catBreeds
            .sink(receiveValue: { cats in
                guard !self.catViewModel.catBreeds.isEmpty else { return }
                self.expectation.fulfill()
            })
            .store(in: &setCancellables)
        
        wait(for: [expectation], timeout: 3)
        XCTAssertEqual(expectedValue.first?.breed, catViewModel.catBreeds.first?.breed)
        XCTAssertEqual(expectedValue.first?.country, catViewModel.catBreeds.first?.country)
        XCTAssertEqual(expectedValue.first?.origin, catViewModel.catBreeds.first?.origin)
        XCTAssertEqual(expectedValue.first?.coat, catViewModel.catBreeds.first?.coat)
        XCTAssertEqual(expectedValue.first?.pattern, catViewModel.catBreeds.first?.pattern)
        
        
    }

}

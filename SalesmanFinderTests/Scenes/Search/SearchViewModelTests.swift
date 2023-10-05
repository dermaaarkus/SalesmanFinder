//
//  SearchViewModelTests.swift
//  SalesmanFinderTests
//
//  Created by Markus on 05.10.23.
//

import XCTest
@testable import SalesmanFinder

final class SearchViewModelTests: XCTestCase {

    func test_init() throws {
        // given
        let viewModel = makeViewModel()
        
        // when
        
        // then
        XCTAssert(viewModel.searchText.isEmpty)
        XCTAssert(viewModel.salesmen.isEmpty)
    }
    
    func test_load_givenSingleSalesman() async throws {
        // given
        let salesmen = [
            Salesman(name: "John Appleseed", areas: ["12345"])
        ]
        let viewModel = makeViewModel(salesmen: salesmen)
        
        // when
        await viewModel.load()
        
        // then
        let salesman = viewModel.salesmen.first
        XCTAssertEqual(salesman?.firstCharacter, "J")
        XCTAssertEqual(salesman?.name, "John Appleseed")
        XCTAssertEqual(salesman?.details, "12345")
    }
    
    func test_load_givenMultipleSalesmen() async throws {
        // given
        let salesmen = [
            Salesman(name: "John Appleseed", areas: ["12345"]),
            Salesman(name: "Jane Appleseed", areas: ["12345, 54321"])
        ]
        let viewModel = makeViewModel(salesmen: salesmen)
        
        // when
        await viewModel.load()
        
        // then
        let firstSalesman = viewModel.salesmen.first
        XCTAssertEqual(firstSalesman?.firstCharacter, "J")
        XCTAssertEqual(firstSalesman?.name, "John Appleseed")
        XCTAssertEqual(firstSalesman?.details, "12345")
        
        let lastSalesman = viewModel.salesmen.last
        XCTAssertEqual(lastSalesman?.firstCharacter, "J")
        XCTAssertEqual(lastSalesman?.name, "Jane Appleseed")
        XCTAssertEqual(lastSalesman?.details, "12345, 54321")
    }
    
    // MARK: - Helpers

    private func makeViewModel(salesmen: [Salesman]? = nil) -> SearchViewModel {
        let repository = SearchRepositoryMock(salesmen: salesmen)
        return SearchViewModel(repository: repository)
    }
}

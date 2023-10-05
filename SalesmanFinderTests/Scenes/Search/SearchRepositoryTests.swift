//
//  SearchRepositoryTests.swift
//  SalesmanFinderTests
//
//  Created by Markus on 05.10.23.
//

import XCTest
@testable import SalesmanFinder

final class SearchRepositoryTests: XCTestCase {
    func test_getSalesmanList() async throws {
        // given
        let repository = SearchRepository()
        
        // when
        let salesman = try await repository.getSalesmanList()
        
        // then
        XCTAssertEqual(salesman, [
            .init(name: "Artem Titarenko", areas: ["76133"]),
            .init(name: "Bernd Schmitt", areas: ["7619*"]),
            .init(name: "Chris Krapp", areas: ["762*"]),
            .init(name: "Alex Uber", areas: ["86*"]),
        ])
    }
}

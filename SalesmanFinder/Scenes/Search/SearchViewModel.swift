//
//  SearchViewModel.swift
//  SalesmanFinder
//
//  Created by Markus on 05.10.23.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    private let repository: any SearchRepositoryProtocol
    
    init(repository: any SearchRepositoryProtocol) {
        self.repository = repository
    }
}

//
//  SearchViewModel.swift
//  SalesmanFinder
//
//  Created by Markus on 05.10.23.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var salesmenItems: [SearchDisplayModel.Salesman] = []
    
    private let repository: any SearchRepositoryProtocol
    
    init(repository: any SearchRepositoryProtocol) {
        self.repository = repository
    }
    
    @MainActor
    func load() async {
        do {
            salesmenItems = try await repository.getSalesmanList().map(makeSalesmanDisplayModel)
        } catch {
            // TODO: implement error view and show
            assertionFailure("failure handling is not implemented!")
        }
    }
    
    private func makeSalesmanDisplayModel(_ dataModel: Salesman) -> SearchDisplayModel.Salesman {
        .init(name: dataModel.name)
    }
}

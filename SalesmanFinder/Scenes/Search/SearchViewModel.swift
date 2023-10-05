//
//  SearchViewModel.swift
//  SalesmanFinder
//
//  Created by Markus on 05.10.23.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var salesmen: [SearchDisplayModel.Salesman] = []
    
    private let repository: any SearchRepositoryProtocol
    
    init(repository: any SearchRepositoryProtocol) {
        self.repository = repository
    }
    
    @MainActor
    func load() async {
        do {
            salesmen = try await repository
                .getSalesmanList()
                .compactMap(makeSalesmanDisplayModel)
        } catch {
            // TODO: implement error view and show
            assertionFailure("failure handling is not implemented!")
        }
    }
    
    private func makeSalesmanDisplayModel(_ dataModel: Salesman) -> SearchDisplayModel.Salesman? {
        guard let firstCharacter = dataModel.name.first else {
            assertionFailure("expect 'name' to be not empty and have a first character!")
            return nil
        }
        
        let name = dataModel.name
        let details = dataModel.areas.joined(separator: ", ")
        
        return .init(
            firstCharacter: firstCharacter,
            name: name,
            details: details
        )
    }
}

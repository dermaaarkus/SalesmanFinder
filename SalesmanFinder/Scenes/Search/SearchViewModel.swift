//
//  SearchViewModel.swift
//  SalesmanFinder
//
//  Created by Markus on 05.10.23.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    
    enum Constant {
        static let searchDebounceTimeInterval = 1
    }
    
    @Published var searchText: String = ""
    @Published var salesmen: [SearchDisplayModel.Salesman] = []
    
    private var allSalesmen: [Salesman] = []
    private let repository: any SearchRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(repository: any SearchRepositoryProtocol) {
        self.repository = repository
        
        setupBindings()
    }
    
    private func setupBindings() {
        $searchText
            .debounce(for: .seconds(Constant.searchDebounceTimeInterval), scheduler: DispatchQueue.main)
            .sink { [weak self] text in
                self?.search(for: text)
            }
            .store(in: &cancellables)
    }
    
    // MARK: Loading
    
    @MainActor
    func load() async {
        do {
            allSalesmen = try await repository
                .getSalesmanList()
            salesmen = allSalesmen.compactMap(makeSalesmanDisplayModel)
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
    
    // MARK: Search
    
    private func search(for text: String) {
        let filteredSalesmen = filterSalesmen(allSalesmen, operatingInArea: text)
        salesmen = filteredSalesmen.compactMap(makeSalesmanDisplayModel)
    }
    
    func filterSalesmen(_ salesmen: [Salesman], operatingInArea text: String) -> [Salesman] {
        if text.isEmpty {
            // show all salesmen
            return allSalesmen
        }
        
        return allSalesmen.filter { salesman in
            isSalesman(salesman, operatingInArea: text)
        }
    }
    
    private func isSalesman(_ salesman: Salesman, operatingInArea text: String) -> Bool {
        let numbersOnlyAreas = salesman.areas.map {
            var area = $0
            area.removeAll { $0 == "*" }
            return area
        }
        
        return numbersOnlyAreas.contains { area in
            if text.count <= area.count {
                return area.starts(with: text)
            } else {
                return text.starts(with: area)
            }
        }
    }
}

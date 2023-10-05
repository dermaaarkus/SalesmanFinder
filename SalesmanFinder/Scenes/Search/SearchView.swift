//
//  SearchView.swift
//  SalesmanFinder
//
//  Created by Markus on 05.10.23.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.salesmen) { salesman in
                        SearchSalesmanView(salesman: salesman)
                    }
                }
            }
            .navigationTitle("Addresses")
        }
        .searchable(text: $viewModel.searchText, prompt: "Search")
        .task {
            await viewModel.load()
        }
    }
}

// MARK: - Preview

#Preview {
    let repository = SearchRepositoryMock(salesmen: [
        .init(name: "John Appleseed", areas: ["12345"])
    ])
    let viewModel = SearchViewModel(repository: repository)
    
    return SearchView(viewModel: viewModel)
}

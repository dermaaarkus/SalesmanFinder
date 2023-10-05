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
                    ForEach(viewModel.salesmenItems) { item in
                        Text("Row \(item.name)")
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

#Preview {
    let repository = SearchRepositoryMock()
    let viewModel = SearchViewModel(repository: repository)
    
    return SearchView(viewModel: viewModel)
}

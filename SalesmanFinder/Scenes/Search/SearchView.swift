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
            Text("")
                .navigationTitle("Addresses")
        }
        .searchable(text: $viewModel.searchText, prompt: "Search")
    }
}

#Preview {
    let repository = SearchRepositoryMock()
    let viewModel = SearchViewModel(repository: repository)
    
    return SearchView(viewModel: viewModel)
}

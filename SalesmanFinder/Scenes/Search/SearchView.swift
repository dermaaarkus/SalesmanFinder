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
        Text("Search View")
    }
}

#Preview {
    let viewModel = SearchViewModel()
    
    return SearchView(viewModel: viewModel)
}

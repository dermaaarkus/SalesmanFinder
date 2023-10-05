//
//  SalesmanFinderApp.swift
//  SalesmanFinder
//
//  Created by Markus on 05.10.23.
//

import SwiftUI

@main
struct SalesmanFinderApp: App {
    
    let appDependency = AppDependency()
    
    var body: some Scene {
        WindowGroup {
            let repository = appDependency.searchRepository
            let viewModel = SearchViewModel(repository: repository)
            
            SearchView(viewModel: viewModel)
        }
    }
}

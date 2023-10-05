//
//  SearchDisplayModel.swift
//  SalesmanFinder
//
//  Created by Markus on 05.10.23.
//

import Foundation

enum SearchDisplayModel {
    struct Salesman: Identifiable {
        // NOTE: is the name unique? I assume so but in a real world probably not.
        //          this requirement must be clarified with product management.
        var id: String { name }
        
        let name: String
    }
}

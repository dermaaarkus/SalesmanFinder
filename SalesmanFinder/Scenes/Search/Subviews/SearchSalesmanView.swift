//
//  SearchSalesmanView.swift
//  SalesmanFinder
//
//  Created by Markus on 05.10.23.
//

import SwiftUI

struct SearchSalesmanView: View {
    
    let salesman: SearchDisplayModel.Salesman
    
    var body: some View {
        Text("Row \(salesman.name)")
    }
}

#Preview {
    SearchSalesmanView(salesman: .init(name: "John Appleseed"))
}

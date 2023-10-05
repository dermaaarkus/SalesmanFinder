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
        
        HStack {
            ZStack {
                Circle()
                    .stroke(StyleGuide.seperatorColor, lineWidth: 1)
                    .fill(StyleGuide.fillColor)
                    .frame(width: 42, height: 42)
                
                Text("A")
                    .foregroundStyle(StyleGuide.textColor)
            }
            .padding(.vertical, 10)
            
            DisclosureGroup(
                content: {
                    Text("PLZ")
                        .foregroundStyle(StyleGuide.secondaryTextColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                },
                label: {
                    Text(salesman.name)
                        .foregroundStyle(StyleGuide.textColor)
                }
            )
            .tint(StyleGuide.secondaryTextColor)
        }
        .padding()
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    SearchSalesmanView(salesman: .init(name: "John Appleseed"))
}

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
        
        VStack {
            HStack {
                circle
                    .padding(.vertical, 17)
                
                DisclosureGroup(
                    content: {
                        details
                    },
                    label: {
                        name
                    }
                )
                // TODO: fix that the disclosure arrow seems not to adapt correctly to this color.
                .tint(StyleGuide.secondaryTextColor)
            }
            .padding(.trailing)
            
            Divider()
                .tint(StyleGuide.strokeColor)
        }
        .padding(.leading)
    }
    
    private var circle: some View {
        ZStack {
            Circle()
                .stroke(StyleGuide.strokeColor, lineWidth: 2)
                .fill(StyleGuide.fillColor)
                .frame(width: 42, height: 42)
            
            Text(String(salesman.firstCharacter))
                .foregroundStyle(StyleGuide.textColor)
        }
    }
    
    private var name: some View {
        Text(salesman.name)
            .foregroundStyle(StyleGuide.textColor)
    }
    
    private var details: some View {
        Text("PLZ")
            .foregroundStyle(StyleGuide.secondaryTextColor)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    SearchSalesmanView(salesman: .init(
        firstCharacter: "J",
        name: "John Appleseed"
    ))
}

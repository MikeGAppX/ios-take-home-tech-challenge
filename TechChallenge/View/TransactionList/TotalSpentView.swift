//
//  TotalSpentView.swift
//  TechChallenge
//
//  Created by Mikael Galliot on 18/10/2021.
//

import SwiftUI

struct TotalSpentView: View {
    
    @ObservedObject var viewModel:TransactionViewModel
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                
                if let selectedCategory = viewModel.selectedCategory {
                    Text("\(selectedCategory.rawValue)")
                        .font(.headline).foregroundColor(selectedCategory.color)
                }else {
                    Text(Constants.all)
                        .font(.headline)
                }
            }
            HStack {
                Text(Constants.totalSpent)
                    .fontWeight(.regular)
                    .secondary()
                Spacer()
                Text("$ \(viewModel.getTotalSpent(for: viewModel.selectedCategory?.rawValue ?? ""))")
                    .fontWeight(.bold)
                    
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color.accentColor,lineWidth:2.0)
        )
        
    }
}

struct TotalSpentView_Previews: PreviewProvider {
    static var previews: some View {
        TotalSpentView(viewModel: TransactionViewModel(transactions:ModelData.sampleTransactions))
    }
}

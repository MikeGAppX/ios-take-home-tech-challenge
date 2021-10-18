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
                if(viewModel.sCategory == ""){
                    Text("all")
                        .font(.headline)
                }else {
                    Text("\(viewModel.sCategory)")
                        .font(.headline)
                }
            }
            HStack {
                Text("Total Spent:")
                    .fontWeight(.regular)
                //                    .labelStyle(.secondary)  CUSTOM SECONDARY HERE
                Spacer()
                Text("$ \(viewModel.getTotalSpent(for: viewModel.sCategory))")
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



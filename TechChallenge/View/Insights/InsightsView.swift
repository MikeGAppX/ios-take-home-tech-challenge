//
//  InsightsView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 29/7/21.
//

import SwiftUI

struct InsightsView: View {
    
    
    @ObservedObject var viewModel:TransactionViewModel
    
    let transactions: [TransactionModel] = ModelData.sampleTransactions
    
    var body: some View {
        List {
            RingView(viewModel:viewModel, transactions: transactions)
                .scaledToFit()
            
            ForEach(TransactionModel.Category.allCases) { category in
                HStack {
                    Text(category.rawValue)
                        .font(.headline)
                        .foregroundColor(category.color)
                    Spacer()
                    Text("\(viewModel.getTotalSpent(for: category.rawValue))")
                        .bold()
                        .secondary()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Insights")
    }
}

#if DEBUG
struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView(viewModel: TransactionViewModel(transactions:ModelData.sampleTransactions))
            .previewLayout(.sizeThatFits)
    }
}
#endif

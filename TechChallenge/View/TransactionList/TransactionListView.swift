//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI


struct TransactionListView: View {
    
    @ObservedObject var viewModel:TransactionViewModel
    
    var body: some View {
        
        VStack {
            TransactionCategoryView(viewModel: viewModel)
                .frame(alignment: .top)
            Spacer()
            
            List {
                ForEach(viewModel.filtereCategories(for: viewModel.selectedCategory?.rawValue ?? "")) { transaction in
                    TransactionView(viewModel: viewModel, transaction: transaction)
                }
            }
            
            TotalSpentView(viewModel: viewModel).frame( alignment: .bottom)
                .padding(.horizontal)
            
        }
        .animation(.easeIn)
        .listStyle(PlainListStyle())
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Transactions")
    }
    
    
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(viewModel: TransactionViewModel(transactions:ModelData.sampleTransactions))
    }
}
#endif




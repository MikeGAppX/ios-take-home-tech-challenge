//
//  TransactionCategoryView.swift
//  TechChallenge
//
//  Created by Mikael Galliot on 18/10/2021.
//

import SwiftUI

struct TransactionCategoryView: View {
    
    @ObservedObject var viewModel:TransactionViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center) {
                
                Button(action: {
                    viewModel.selectedCategory = nil
                }) {
                    Text(Constants.all)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.horizontal, 5.0/*@END_MENU_TOKEN@*/)
                }
                .padding(.all, 5.0)
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(15.0)
                
                ForEach(TransactionModel.Category.allCases) { category in
                    Button(action: {
                        viewModel.selectedCategory = category
                    }) {
                        Text(category.rawValue)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal, 5.0)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .background(category.color)
                    .cornerRadius(15.0)
                    
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
            
            
        }.background(Color.accentColor.opacity(0.8))
    }
}

struct TransactionCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionCategoryView(viewModel:TransactionViewModel(transactions:ModelData.sampleTransactions))
    }
}

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
            CategoryView
                .frame( alignment: .top)
//            Spacer()
            
            List {
                ForEach(viewModel.filteredCategories(for: viewModel.sCategory)) { transaction in
                    TransactionView(viewModel: viewModel, transaction: transaction)
                }
            }
            
            TotalSpentView(viewModel: viewModel).frame(height:70, alignment: .bottom)
                .padding(.horizontal, 5)
            
        }
        .animation(.easeIn)
        .listStyle(PlainListStyle())
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Transactions")
    }
    
    
    var CategoryView : some View {
//        VStack{
            ScrollView(.horizontal) {
                HStack(alignment: .center) {
                    
                    Button(action: {
                        viewModel.sCategory = ""
                    }) {
                        Text("All")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(/*@START_MENU_TOKEN@*/.horizontal, 5.0/*@END_MENU_TOKEN@*/)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(15.0)
                    
                    ForEach(TransactionModel.Category.allCases) { category in
                        Button(action: {
                            viewModel.sCategory = category.rawValue
                        }) {
                            Text(category.rawValue)
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(/*@START_MENU_TOKEN@*/.horizontal, 5.0/*@END_MENU_TOKEN@*/)
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
        
//    }
}

#if DEBUG
//struct TransactionListView_Previews: PreviewProvider {
//    static var previews: some View {
//       // TransactionListView()
//    }
//}
#endif

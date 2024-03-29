//
//  TransactionView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI


struct TransactionView: View {
    
    @ObservedObject var viewModel:TransactionViewModel
    var transaction: TransactionModel
    @State var isPinned  = false
    
    var body: some View {
        VStack {
            HStack {
                Text(transaction.category.rawValue)
                    .font(.headline)
                    .foregroundColor(transaction.category.color)
                Spacer()
                Button(action: {
                    transaction.isPinned.toggle()
                    self.isPinned.toggle()
                    viewModel.updateTotalSpent.toggle()
                }) {
                    Image(systemName:self.isPinned == true ? "pin.slash.fill" : "pin.fill")

                }
            }
            
            if !transaction.isPinned {
                HStack {
                    transaction.image
                        .resizable()
                        .frame(
                            width: 60.0,
                            height: 60.0,
                            alignment: .top
                        )
                    
                    VStack(alignment: .leading) {
                        Text(transaction.name)
                            .secondary()
                        Text(transaction.accountName)
                            .tertiary()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("$\(transaction.amount.formatted())")
                            .bold()
                            .secondary()
                        Text(transaction.date.formatted)
                            .tertiary()
                    }
                }
            }
            
        }
        .padding(8.0)
        .background(Color.accentColor.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
    }
}

#if DEBUG
struct TransactionView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            TransactionView(viewModel:TransactionViewModel(transactions:ModelData.sampleTransactions), transaction: ModelData.sampleTransactions[0])
            TransactionView(viewModel:TransactionViewModel(transactions:ModelData.sampleTransactions), transaction: ModelData.sampleTransactions[1])
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif

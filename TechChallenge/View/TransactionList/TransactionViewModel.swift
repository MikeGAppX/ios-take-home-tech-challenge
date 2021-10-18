//
//  TransactionViewModel.swift
//  TechChallenge
//
//  Created by Mikael Galliot on 18/10/2021.
//

import Foundation

protocol TransactionViewModelType {
    
}


class TransactionViewModel:ObservableObject, TransactionViewModelType {
    
    @Published var transactions: [TransactionModel] = ModelData.sampleTransactions
    
    @Published var updateTotalSpent = true
    @Published var sCategory:String = ""
    
    
    func filteredCategories(for category:String)-> [TransactionModel] {
        
        if category.isEmpty {
            return transactions
        }
        return transactions.filter {
            $0.category.rawValue == category
        }
    }
    
    func getTotalSpent(for selectedCategory:String)-> Double {
        
        let selectedTransactions = filteredCategories(for: selectedCategory)
        return selectedTransactions.reduce(0.0) { value, model in
            return model.isPinned ? value + model.amount : value
        }
    }
}

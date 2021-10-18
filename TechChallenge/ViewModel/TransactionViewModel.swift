//
//  TransactionViewModel.swift
//  TechChallenge
//
//  Created by Mikael Galliot on 18/10/2021.
//

import Foundation


protocol TransactionViewModelType {
    func filtereCategories(for category:String)-> [TransactionModel]
    func getTotalSpent(for selectedCategory:String)-> Double
    func getCategorySpendRatio(categoryIndex: Int)-> Double
    func getCategorySpentOffset(categoryIndex: Int)-> Double
}


final class TransactionViewModel:ObservableObject, TransactionViewModelType {
    
    @Published var transactions: [TransactionModel]
    @Published var updateTotalSpent = true
    @Published var sCategory:String = ""
    
    init(transactions:[TransactionModel]) {
        self.transactions = transactions
    }
    
    /*
     This function will filter transactions based upon category passed , if category is empty than will return all categories.
     @param : category Name
     @return: array of TransactionModel
     */
    func filtereCategories(for category:String)-> [TransactionModel] {
        if category.isEmpty {
            return transactions
        }
        return transactions.filter {
            $0.category.rawValue == category
        }
    }
    
    /*
     This function will calculate total amount spent  based upon category passed and pinned transacton for that passed category, if category is empty will return all transactoins spent sum.
     @param : category Name
     @return: double : total spent
     */
    func getTotalSpent(for selectedCategory:String)-> Double {
        let selectedTransactions = filtereCategories(for: selectedCategory)
        return selectedTransactions.reduce(0.0) { value, model in
            return model.isPinned ? value : value + model.amount
        }
    }
    
    /*
     This function will calculate ratio of total spent for selected category for pinned transactions
     @param : category Index
     @return: double : spent Ratio for category
     */
    func getCategorySpendRatio(categoryIndex: Int)-> Double {
        let categoryName = TransactionModel.Category.allCases[categoryIndex].rawValue
        let totalSpent = getTotalSpent(for:"")
        
        let spentForCategory = getTotalSpent(for: categoryName)
        
        return(spentForCategory)/totalSpent
    }
    
    /*
     This function will calculate offset positon for particular category based upon pinned transactons.
     @param : category Index
     @return: double : offset position
     */
    func getCategorySpentOffset(categoryIndex: Int)-> Double {
        
        let totalSpent = getTotalSpent(for:"")
        var offSet = 0.0
        for i in 0..<categoryIndex {
            let category = TransactionModel.Category.allCases[i].rawValue
            let spentForCategory = getTotalSpent(for:category)
            let value = (spentForCategory)/totalSpent
            offSet = offSet + value
        }
        return offSet
    }
}


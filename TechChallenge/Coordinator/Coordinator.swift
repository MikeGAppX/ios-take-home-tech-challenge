//
//  Coordinator.swift
//  TechChallenge
//
//  Created by Mikael Galliot on 18/10/2021.
//

import Foundation


enum CoordinatorTab {
    case Transactions
    case Insights
}
class Coordinator: ObservableObject {
    
    @Published var tab = CoordinatorTab.Transactions
    @Published var transactionViewModel: TransactionViewModel!
    
    init() {
        self.transactionViewModel = TransactionViewModel(transactions: ModelData.sampleTransactions)
    }
    func switchToTabTransactoin() {
        self.tab = .Transactions
    }
}

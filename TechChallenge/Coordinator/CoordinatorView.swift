//
//  CoordinatorView.swift
//  TechChallenge
//
//  Created by Mikael Galliot on 18/10/2021.
//

import SwiftUI

struct CoordinatorView: View {
    
    @ObservedObject var object: Coordinator
    
    var body: some View {
        TabView(selection: $object.tab) {
            
            NavigationView {
                TransactionListView(viewModel: object.transactionViewModel)
            }
            .tabItem {
                Label("Transactions", systemImage: "list.bullet")
            }.tag(CoordinatorTab.Transactions)
            
            
            NavigationView {
                InsightsView(viewModel: object.transactionViewModel)
            }
            .tabItem {
                Label("Insights", systemImage: "chart.pie.fill")
            }.tag(CoordinatorTab.Insights)
            
        }
    }
    
}
struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView(object: Coordinator())
    }
}

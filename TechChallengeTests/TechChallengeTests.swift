//
//  TechChallengeTests.swift
//  TechChallengeTests
//
//  Created by Adrian Tineo Cabello on 30/7/21.
//

import XCTest
@testable import TechChallenge

class TechChallengeTests: XCTestCase {
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Category Food , when all items are pinned
    func testGetCategorySpendRatioAndOffset() {
        
        let viewModel = TransactionViewModel(transactions: ModelData.sampleTransactions)
        
        let ratio = viewModel.getCategorySpendRatio(categoryIndex:0)
        
        XCTAssertEqual(ratio, 0.1573462125063549)
        
        let offset = viewModel.getCategorySpentOffset(categoryIndex:0)
        
        XCTAssertEqual(offset, 0.0)
        
    }
    
    // Category Food , when all items are not pinned
    func testGetCategorySpendRatioAndOffset_whenfoodIsPinned() {
        
        let transactions =  ModelData.sampleTransactions
        transactions[2].isPinned = true
        
        
        let viewModel = TransactionViewModel(transactions: transactions)
        
        
        var offSet = viewModel.getCategorySpendRatio(categoryIndex:0)
        
        XCTAssertEqual(offSet, 0.10958904109589043)
        
        transactions[7].isPinned = true
        
        offSet = viewModel.getCategorySpentOffset(categoryIndex:1)
        
        XCTAssertEqual(offSet, 0.11513769019119066)
        
        transactions[2].isPinned = false
        transactions[7].isPinned = false//restoring state as its global data
        
    }
    
    // Filtered Items for All , Shoping, Food, Entertainment
    func testFilterCategoryAll() {
        let transactions =  ModelData.sampleTransactions
        let viewModel = TransactionViewModel(transactions: transactions)
        var filteredTransactons = viewModel.filtereCategories(for:"")
        
        XCTAssertEqual(filteredTransactons.count, 13)
        
        
        filteredTransactons = viewModel.filtereCategories(for:TransactionModel.Category.shopping.rawValue)
        
        XCTAssertEqual(filteredTransactons.count, 3)
        
        filteredTransactons = viewModel.filtereCategories(for:TransactionModel.Category.food.rawValue)
        
        XCTAssertEqual(filteredTransactons.count, 5)
        
        filteredTransactons = viewModel.filtereCategories(for:TransactionModel.Category.entertainment.rawValue)
        
        XCTAssertEqual(filteredTransactons.count, 1)
    }
    
    // Test Total Spent for All , Shopping, food, entertainment category when no item is pinned
    func testTotalSpent_whenNoItemPinned() {
        let transactions =  ModelData.sampleTransactions
        let viewModel = TransactionViewModel(transactions: transactions)
        
        var totalSpent = viewModel.getTotalSpent(for:"")
        
        
        XCTAssertEqual(totalSpent, 472.0799999999999)
        
        
        totalSpent = viewModel.getTotalSpent(for:TransactionModel.Category.shopping.rawValue)
        
        XCTAssertEqual(totalSpent, 78.0)
        
        totalSpent = viewModel.getTotalSpent(for:TransactionModel.Category.food.rawValue)
        
        XCTAssertEqual(totalSpent, 74.28)
        
        totalSpent = viewModel.getTotalSpent(for:TransactionModel.Category.entertainment.rawValue)
        
        XCTAssertEqual(totalSpent, 82.99)
        
        
    }
    
    
    // Test Total Spent for All , Shopping, food, entertainment category when no item is pinned
    func testTotalSpent_whenAtleastOneItemPinned() {
        
        let transactions =  ModelData.sampleTransactions
        
        transactions[0].isPinned = true
        transactions[1].isPinned = true
        transactions[2].isPinned = true
        
        let viewModel = TransactionViewModel(transactions: transactions)
        
        var totalSpent = viewModel.getTotalSpent(for:"")
        
        XCTAssertEqual(totalSpent, 309.16999999999996)
        
        
        totalSpent = viewModel.getTotalSpent(for:TransactionModel.Category.shopping.rawValue)
        
        XCTAssertEqual(totalSpent, 23.4)
        
        totalSpent = viewModel.getTotalSpent(for:TransactionModel.Category.food.rawValue)
        
        XCTAssertEqual(totalSpent, 48.959999999999994)
        
        totalSpent = viewModel.getTotalSpent(for:TransactionModel.Category.entertainment.rawValue)
        
        XCTAssertEqual(totalSpent, 0.0)
        
        //restoring state as its global data
        transactions[0].isPinned = false
        transactions[1].isPinned = false
        transactions[2].isPinned = false
    }
}

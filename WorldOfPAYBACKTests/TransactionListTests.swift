//
//  WorldOfPAYBACKTests.swift
//  WorldOfPAYBACKTests
//
//  Created by Alexander Yeskin on 3.02.24.
//

import XCTest
import ComposableArchitecture
@testable import WorldOfPAYBACK

@MainActor
class TransactionListTests: XCTestCase {
    func testTransactionsResponseSucceed() async {
        let store = TestStore(initialState: TransactionList.State()) {
            TransactionList()
        } withDependencies: {
            $0.transactionClient.transactions = { @Sendable in .mock }
        }
        
        await store.send(.onAppear)
        await store.receive(.fetchTransactions)
        
        await store.receive(\.transactionsResponse.success, timeout: .seconds(5)) {
            $0.transactions = Transactions.mock.items
            $0.loadingState = .loaded
        }
    }
    
    func testTransactionsResponseFailed() async {
        let store = TestStore(initialState: TransactionList.State()) {
            TransactionList()
        } withDependencies: {
            $0.transactionClient.transactions = { @Sendable in throw SomethingWentWrong() }
        }
        
        await store.send(.onAppear)
        await store.receive(.fetchTransactions)
        
        await store.receive(\.transactionsResponse.failure, timeout: .seconds(5)) {
            $0.transactions = []
            $0.loadingState = .error
        }
    }
    
    func testFilterTransactionsByCategory() async {
        let store = TestStore(initialState: TransactionList.State()) {
            TransactionList()
        }
        
        await store.send(.filterTransactionsByCategory(.firstCategory)) {
            $0.categoryFilter = .firstCategory
        }
    }
}

private struct SomethingWentWrong: Equatable, Error {}

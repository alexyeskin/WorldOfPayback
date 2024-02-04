//
//  TransactionList.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 29.01.24.
//

import ComposableArchitecture

@Reducer
struct TransactionList {
    @ObservableState
    struct State: Equatable {
        var transactions: [Transaction] = []
        var loadingState = LoadingState.loading
        var categoryFilter = Transaction.Category.withoutCategory
        
        var sortedTransactions: [Transaction] {
            let sortedTransactions = transactions.sorted(by: { $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate })
            if categoryFilter == .withoutCategory {
                return sortedTransactions
            } else {
                return sortedTransactions.filter { $0.category == categoryFilter }
            }
        }
        
        var totalAmount: Int {
            return sortedTransactions.map { $0.transactionDetail.value.amount }.reduce(0, +)
        }
        
        enum LoadingState: String { case loading, loaded, error }
    }
    
    enum Action: Equatable {
        case onAppear
        case fetchTransactions
        case transactionsResponse(Result<Transactions, TransactionsError>)
        case filterTransactionsByCategory(Transaction.Category)
        case transactionTapped(Transaction)
    }
    
    @Dependency(\.transactionClient) var transactionClient
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                guard state.transactions.isEmpty else {
                    return .none
                }
                
                return .send(.fetchTransactions)
                
            case .fetchTransactions:
                state.transactions = []
                state.loadingState = .loading
                
                return .run { send in
                    await send(
                        .transactionsResponse(
                            Result { try await transactionClient.transactions() }
                                .mapError { error in
                                    if let error = error as? TransactionsError {
                                        return error
                                    } else {
                                        return TransactionsError.unknown
                                    }
                                }
                        )
                    )
                }
                
            case let .transactionsResponse(.success(result)):
                state.transactions = result.items
                state.loadingState = .loaded
                
                return .none
                
            case .transactionsResponse(.failure):
                state.transactions = []
                state.loadingState = .error
                
                return .none
                
            case let .filterTransactionsByCategory(category):
                state.categoryFilter = category
                
                return .none
                
            case .transactionTapped:
                return .none
            }
        }
    }
}

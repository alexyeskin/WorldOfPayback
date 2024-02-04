//
//  TransactionListView.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 29.01.24.
//

import SwiftUI
import ComposableArchitecture

struct TransactionListView: View {
    var store: StoreOf<TransactionList>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                List(viewStore.sortedTransactions) { transaction in
                    TransactionView(transaction: transaction)
                        .onTapGesture {
                            viewStore.send(.transactionTapped(transaction))
                        }
                }
                .refreshable {
                    viewStore.send(.fetchTransactions)
                }
                VStack {
                    CategoryFilterView(store: store)
                    TotalAmountView(totalAmount: viewStore.totalAmount)
                }
            }
            .onAppear {
                store.send(.onAppear)
            }
            .overlay(
                Group {
                    if store.loadingState == .error {
                        ErrorView {
                            store.send(.fetchTransactions)
                        }
                    }
                    if store.loadingState == .loading {
                        ProgressView()
                    }
                }
            )
        }
        
        .navigationBarBackButtonHidden()
        .navigationBarTitle("Transactions")
    }
}


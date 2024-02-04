//
//  TransactionDetails.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 3.02.24.
//

import ComposableArchitecture

@Reducer
struct TransactionDetails {
    @ObservableState
    struct State: Equatable {
        let transaction: Transaction
    }
    
    enum Action {}
    
    var body: some Reducer<State, Action> {
        EmptyReducer()
    }
}

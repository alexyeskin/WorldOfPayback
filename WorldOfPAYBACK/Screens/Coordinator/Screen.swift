//
//  Screen.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 3.02.24.
//

import ComposableArchitecture
import TCACoordinators

struct Screen: Reducer {
    enum State: Equatable {
        case onboarding(Onboarding.State)
        case transactionList(TransactionList.State)
        case transactionDetails(TransactionDetails.State)
    }
    
    enum Action {
        case onboarding(Onboarding.Action)
        case transactionList(TransactionList.Action)
        case transactionDetails(TransactionDetails.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: /State.onboarding, action: /Action.onboarding) {
            Onboarding()
        }
        Scope(state: /State.transactionList, action: /Action.transactionList) {
            TransactionList()
        }
        Scope(state: /State.transactionDetails, action: /Action.transactionDetails) {
            TransactionDetails()
        }
    }
}

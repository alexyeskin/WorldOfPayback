//
//  Onboarding.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 3.02.24.
//

import ComposableArchitecture

@Reducer
struct Onboarding {
    @ObservableState
    struct State: Equatable {}
    
    enum Action {
        case onboardingPassed
    }
    
    var body: some Reducer<State, Action> {
        EmptyReducer()
    }
}

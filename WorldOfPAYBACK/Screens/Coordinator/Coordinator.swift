//
//  Coordinator.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 3.02.24.
//

import ComposableArchitecture
import TCACoordinators

struct Coordinator: Reducer {
    struct State: Equatable, IndexedRouterState {
        static let initialState = State(
            routes: [.root(.onboarding(.init()), embedInNavigationView: true)]
        )
        
        var routes: [Route<Screen.State>]
    }
    
    enum Action: IndexedRouterAction {
        case routeAction(Int, action: Screen.Action)
        case updateRoutes([Route<Screen.State>])
    }
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .onboarding(.onboardingPassed)):
                state.routes.push(.transactionList(.init()))
                
            case .routeAction(_, action: .transactionList(.transactionTapped(let transaction))):
                state.routes.push(.transactionDetails(.init(transaction: transaction)))
                
            default:
                break
            }
            
            return .none
        }.forEachRoute {
            Screen()
        }
    }
}

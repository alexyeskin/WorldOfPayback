//
//  CoordinatorView.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 3.02.24.
//

import ComposableArchitecture
import SwiftUI
import TCACoordinators

struct CoordinatorView: View {
    let store: StoreOf<Coordinator>
    
    var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .onboarding:
                    CaseLet(
                        /Screen.State.onboarding,
                         action: Screen.Action.onboarding,
                         then: OnboardingView.init
                    )
                    
                case .transactionList:
                    CaseLet(
                        /Screen.State.transactionList,
                         action: Screen.Action.transactionList,
                         then: TransactionListView.init
                    )
                    
                case .transactionDetails:
                    CaseLet(
                        /Screen.State.transactionDetails,
                         action: Screen.Action.transactionDetails,
                         then: TransactionDetailsView.init
                    )
                }
            }
        }
    }
}

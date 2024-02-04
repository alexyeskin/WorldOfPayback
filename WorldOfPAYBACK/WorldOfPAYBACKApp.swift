//
//  WorldOfPAYBACKApp.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 29.01.24.
//

import ComposableArchitecture
import SwiftUI

@main
struct WorldOfPAYBACKApp: App {
    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            if networkMonitor.isConnected {
                CoordinatorView(store: Store(initialState: .initialState, reducer: {
                    Coordinator()
                }))
            } else {
                NoNetworkView()
            }
        }
    }
}

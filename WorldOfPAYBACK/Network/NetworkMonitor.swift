//
//  NetworkMonitor.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 29.01.24.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
    private var monitor: NWPathMonitor
    @Published var isConnected: Bool = true

    init() {
        self.monitor = NWPathMonitor()
        self.startMonitoring()
    }

    private func startMonitoring() {
        self.monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }

        let queue = DispatchQueue(label: "NetworkMonitorQueue")
        self.monitor.start(queue: queue)
    }
}

//
//  FSNetworkStatus.swift
//  FakeStore
//
//  Created by Shivsagar S Wagle on 11/04/23.
//

import Foundation
import Network

class FSNetworkStatus {
    
    let shared = FSNetworkStatus()
    
    var monitor: NWPathMonitor?
    var isMonitoring: Bool = false
    
    var isConnected: Bool {
        guard let monitor = monitor else { return false }
        return monitor.currentPath.status == .satisfied
    }
    
    var networkStatusChangeHandler: ((Bool) -> ())?
    
    private init() { }
    
    func startMonitoring() {
        if isMonitoring {
            return
        }
        monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "Network Status")
        monitor?.pathUpdateHandler = { path in
            self.networkStatusChangeHandler?(path.status == .satisfied)
        }
        monitor?.start(queue: queue)
        isMonitoring = true
    }
    
    func stopMonitoring() {
        guard let monitor = monitor else { return }
        monitor.cancel()
        isMonitoring = false
    }
    
}

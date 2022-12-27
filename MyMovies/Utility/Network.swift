//
//  Network.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 24/12/22.
//

import Foundation
import Network

class Network: ObservableObject {
    
    // MARK: - Private
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")
    
    @Published private(set) var connected: Bool = false
    
    // MARK: - Init
    init() {
        checkConnection()
    }
    
    // MARK: - Methods
    /// Monitors Internet connectivity and updates publisher accordingly
    func checkConnection() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    self.connected = true
                } else {
                    self.connected = false
                }
            }
        }
        monitor.start(queue: queue)
    }
    
}

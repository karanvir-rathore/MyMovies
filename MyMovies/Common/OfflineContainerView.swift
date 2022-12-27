//
//  NoReachabilityContainerView.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 24/12/22.
//

import SwiftUI

struct OfflineContainerView<Content>: View where Content: View {
    
    @StateObject var network = Network()
   
    // MARK: - Private
    
    private let content: Content
    
    // MARK: - Init
    
    /// Initializer
    /// - Parameter content: Content View
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            if network.connected {
                content
            } else {
                HStack {
                    Spacer()
                    LottieView(lottieFile: "NoInternet")
                    Spacer()
                }
            }
        }
    }
}

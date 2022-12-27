//
//  MyMoviesApp.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 20/12/22.
//

import SwiftUI

@main
struct MyMoviesApp: App {
    var body: some Scene {
        WindowGroup {
            OfflineContainerView {
                PopularMoviesScreen()
            }
        }
    }
}

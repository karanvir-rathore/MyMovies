//
//  MovieTileView.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 27/12/22.
//

import SwiftUI
import Kingfisher

struct MovieTileView: View {
    
    let url: URL?
    
    var body: some View {
        KFImage(url)
            .placeholder({
                ProgressView()
            })
            .resizable()
            .scaledToFit()
            .cornerRadius(20)
    }
}

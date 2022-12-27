//
//  GenresAndTimeView.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 26/12/22.
//

import SwiftUI

struct GenresAndTimeView: View {
    
    // MARK: - Public
    let genres: String
    let runtime: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(genres)
                .bold()
                .modifier(BannerModifier())
                
            Spacer()
            
            Text(runtime)
                .bold()
                .modifier(BannerModifier())
        }
    }
}

private struct BannerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(.all, 5)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 1.5)
            )
        
    }
}

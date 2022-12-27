//
//  VoteAndReleaseView.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 26/12/22.
//

import SwiftUI

struct VoteAndReleaseView: View {
    
    // MARK: - Public
    let voteAverage: Double?
    let userScore: String
    let voteCount: Int?
    let release: String
    
    var body: some View {
        HStack(spacing: 0) {
            if let voteAverage = voteAverage {
                HStack(spacing: 15) {
                    ZStack {
                        CircularProgressView(progress: voteAverage / 10)
                        HStack(spacing: 0) {
                            Text(userScore)
                                .font(.body)
                                .bold()
                        }
                    }.frame(width: 50, height: 50)
                    
                    Text("User Score")
                        .font(.subheadline)
                        .bold()
                }
            }
            
            Spacer(minLength: 20)
            
            if let voteCount = voteCount {
                GenericInfoView(title: "Vote",
                                info: "\(voteCount)")
            }
            
            Spacer()
            
            GenericInfoView(title: "Release",
                            info: release)
        }
    }
}

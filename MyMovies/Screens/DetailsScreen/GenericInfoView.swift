//
//  GenericInfoView.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 26/12/22.
//

import SwiftUI

struct GenericInfoView: View {
    
    let title: String
    let info: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .bold()
            Text(info)
                .font(.caption)
        }
    }
}

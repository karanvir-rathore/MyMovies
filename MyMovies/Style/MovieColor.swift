//
//  MovieColor.swift
//  MyMovies
//
//  Created by Rathore, Karanvir on 23/12/22.
//

import SwiftUI

public struct MovieColor {
    
    static let shared = MovieColor()
    
    let progressRangeColor = Color("progressRangeColor")
    let progressColor = Color("progressColor")
    let navTitle = Color("navTitle")
}

extension MovieColor: ShapeStyle {}

extension ShapeStyle where Self == MovieColor {
    static var myMovie: MovieColor { MovieColor.shared }
}

extension Sequence where Element == Color {
   static var myMovie: MovieColor { MovieColor.shared }
}

extension Color {
    static let myMovie = MovieColor.shared
}

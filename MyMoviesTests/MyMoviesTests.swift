//
//  MyMoviesTests.swift
//  MyMoviesTests
//
//  Created by Rathore, Karanvir on 20/12/22.
//

import XCTest
@testable import MyMovies

final class MyMoviesTests: XCTestCase {
    
    var movie: Movie?
    var movieDetails: MovieDetails?

    override func setUpWithError() throws {
        let movieDetailsJsonData = MockData.movieDetailsJson.data(using: .utf8)!
        let movieDetails = MockData.generate(data: movieDetailsJsonData, model: MovieDetails.self)
        self.movieDetails = movieDetails
        
        let movieJsonData = MockData.movieJson.data(using: .utf8)!
        let movie = MockData.generate(data: movieJsonData, model: Movie.self)
        self.movie = movie
    }

    override func tearDownWithError() throws {
        self.movie = nil
        self.movieDetails = nil
    }

    func testUserScore() throws {
        let expectedOutput = "81%"
        XCTAssertEqual(movie?.userScore, expectedOutput)
    }
    
    func testRevenueIsAsPerUSCountry() {
        let expectedOutput = "$609,800,000"
        XCTAssertEqual(movieDetails?.revenueInfo, expectedOutput)
    }
    
    func testRuntimeIsDisplayedInHoursAndMins() {
        let expectedOutput = "3h 12m"
        XCTAssertEqual(movieDetails?.runtimeInfo, expectedOutput)
    }
    
    func testReleaseDate() {
        let expectedOutput = "Jan 14, 2022"
        XCTAssertEqual(movie?.releaseInfo, expectedOutput)
    }
}

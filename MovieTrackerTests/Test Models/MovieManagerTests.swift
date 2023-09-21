//
//  MovieManagerTests.swift
//  MovieTrackerTests
//
//  Created by Balita on 9/21/23.
//

import XCTest
@testable import MovieTracker

final class MovieManagerTests: XCTestCase {
    var sut: MovieManager!
    
    let dcMovie = Movie(title: "Justice League")
    let marvelMovie = Movie(title: "Endgame")
    let foxMovie = Movie(title: "Deadpool")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Initializers
    func testInit_MoviesToSeeCount_ReturnsZero(){
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeenCount_ReturnsZero(){
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }

    // MARK: Add and Queries
    func testAddMovie_MoviesToSeeCount_ReturnsOne(){
        sut.AddMovie(movie: foxMovie)
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex(){
        sut.AddMovie(movie: dcMovie)
        
        let queriedMovie = sut.GetMovieAtIndex(0)
        XCTAssertEqual(dcMovie.title, queriedMovie.title )
    }
    
    // MARK: CheckOff movies
    func testCheckOffMovie_UpdatesMovieManagerCounts(){
        sut.AddMovie(movie: marvelMovie)
        sut.CheckOffMovieAtIndex(0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray(){
        sut.AddMovie(movie: foxMovie)
        sut.AddMovie(movie: dcMovie)
        sut.CheckOffMovieAtIndex(0)
        
        XCTAssertEqual(sut.GetMovieAtIndex(0).title, dcMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex(){
        sut.AddMovie(movie: foxMovie)
        sut.CheckOffMovieAtIndex(0)
        
        let queriedMovie = sut.GetMovieCheckedOffAtIndex(0)
        XCTAssertEqual(foxMovie.title, queriedMovie.title)
    }
    
    // MARK: Comparison of movies
    func testEquatable_ReturnsTrue(){
        let movie1 = Movie(title: "Bad")
        let movie2 = Movie(title: "Bad")
        
        XCTAssertEqual(movie1, movie2)
    }
    
    func testEquatable_ReturnsNotTrueForDifferentTitles(){
         let movie1 = Movie(title: "Bad")
        let movie2 = Movie(title: "Bad2")
            XCTAssertNotEqual(movie1, movie2)
    }
    
    func testEquatable_ReturnsNotTrueForDifferentReleaseDates(){
        let movie1 = Movie(title: "Bad", releaseDate: "2019")
       let movie2 = Movie(title: "Bad", releaseDate: "1900")
           XCTAssertNotEqual(movie1, movie2)
        
    }
    
    // MARK: Duplicate entries
    func testAddMovie_DoNotAddMovieIfAlreadyInArray(){
        sut.AddMovie(movie: dcMovie)
        sut.AddMovie(movie: dcMovie)
        
        XCTAssertEqual(1, sut.moviesToSeeCount)
    }
    
    // MARK: Clear Arrays
    func testClearArrays_ReturnsArraysCountOfZero(){
        sut.AddMovie(movie: dcMovie)
        sut.AddMovie(movie: marvelMovie)
        
        sut.CheckOffMovieAtIndex(0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.ClearArrays()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
        
    }
}

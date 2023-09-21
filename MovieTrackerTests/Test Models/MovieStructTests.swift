//
//  MovieStructTests.swift
//  MovieTrackerTests
//
//  Created by Balita on 9/21/23.
//

import XCTest
@testable import MovieTracker

final class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInit_MovieWithTitle(){
        let testMovie = Movie(title: "Generic Blockbuster")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }
    
    func testInit_MovieWithTitleAndReleaseDate(){
        let testMovie = Movie(title: "Avengers 7", releaseDate: "2025")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Avengers 7")
        XCTAssertEqual(testMovie.releaseDate, "2025")
    }
}

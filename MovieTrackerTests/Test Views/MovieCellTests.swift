//
//  MovieCellTests.swift
//  MovieTrackerTests
//
//  Created by Balita on 9/21/23.
//

import XCTest
@testable import MovieTracker

final class MovieCellTests: XCTestCase {
    
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!
    
    let dcMovie = Movie(title: "Justice League")
    let marvelMovie = Movie(title: "Endgame")
    let foxMovie = Movie(title: "Deadpool")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let libraryVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController)
        _ = libraryVC.view
        
        tableView = libraryVC.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCell_Config_ShouldSetLabelsToMovieData(){
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: IndexPath(row: 0, section: 0)) as! MovieCell
        cell.configMovieCell(movie: foxMovie)
        
        XCTAssertEqual(cell.textLabel?.text, foxMovie.title)
        XCTAssertEqual(cell.detailTextLabel?.text, foxMovie.releaseDate)
    }

}

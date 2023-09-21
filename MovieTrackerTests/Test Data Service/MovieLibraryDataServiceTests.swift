//
//  MovieLibraryDataServiceTests.swift
//  MovieTrackerTests
//
//  Created by Balita on 9/21/23.
//

import XCTest
@testable import MovieTracker

final class MovieLibraryDataServiceTests: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    
    var libraryVC: LibraryViewController!
    
    var tableViewMock: TableViewMock!

    let dcMovie = Movie(title: "Justice League")
    let marvelMovie = Movie(title: "Endgame")
    let foxMovie = Movie(title: "Deadpool")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        tableViewMock = TableViewMock.initMock(dataSource: sut)
        
        libraryVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController) 
        _ = libraryVC.view
        
        libraryTableView = libraryVC.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Sections
    func testsTableViewSections_Count_ReturnsTwo(){
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableViewSections_SectionOne_ReturnsMovieToSeeCount(){
        sut.movieManager?.AddMovie(movie: foxMovie)
        sut.movieManager?.AddMovie(movie: dcMovie)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
        
        sut.movieManager?.AddMovie(movie: marvelMovie)
        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableViewSections_SectionTwo_ReturnsMovieSeenCount(){
        sut.movieManager?.AddMovie(movie: foxMovie)
        sut.movieManager?.AddMovie(movie: dcMovie)
        sut.movieManager?.CheckOffMovieAtIndex(0)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
        
        sut.movieManager?.CheckOffMovieAtIndex(0)
        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 2)
        
    }
    
    // MARK: Cells
    func testCell_RowAtIndex_ReturnsMovieCell(){
        sut.movieManager?.AddMovie(movie: marvelMovie)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func testCell_ShouldDequeueCell(){
        sut.movieManager?.AddMovie(movie: dcMovie)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData(){
        sut.movieManager?.AddMovie(movie: dcMovie)
        tableViewMock.reloadData()
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, dcMovie)
    }
    
    func testCell_SectionTwoConfig_ShouldSetCellData(){
        sut.movieManager?.AddMovie(movie: foxMovie)
        sut.movieManager?.AddMovie(movie: marvelMovie)
        sut.movieManager?.CheckOffMovieAtIndex(0)
        tableViewMock.reloadData()
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, foxMovie)
    }
    
    // MARK: CheckOff Movie
    func testCell_Selection_ShouldCheckOffSelectedMovie(){
        sut.movieManager?.AddMovie(movie: marvelMovie)
        sut.movieManager?.AddMovie(movie: foxMovie)
        libraryTableView.delegate?.tableView?(libraryTableView, didSelectRowAt:  IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        XCTAssertEqual(sut.movieManager?.GetMovieAtIndex(0), foxMovie)
        XCTAssertEqual(sut.movieManager?.GetMovieCheckedOffAtIndex(0), marvelMovie)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
    }

}

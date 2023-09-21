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

    let dcMovie = Movie(title: "Justice League")
    let marvelMovie = Movie(title: "Endgame")
    let foxMovie = Movie(title: "Deadpool")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
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
        let mock = TableViewMock()
        mock.dataSource = sut
        mock.register(MovieCell.self, forCellReuseIdentifier: "movieCellID")
        
        sut.movieManager?.AddMovie(movie: dcMovie)
        mock.reloadData()
        _ = mock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mock.cellDequeuedProperly)
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData(){
        let mock = TableViewMock()
        mock.dataSource = sut
        mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellID")
        
        sut.movieManager?.AddMovie(movie: dcMovie)
        mock.reloadData()
        let cell = mock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, dcMovie)
    }

}

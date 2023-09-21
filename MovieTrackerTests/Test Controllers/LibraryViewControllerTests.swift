//
//  LibraryViewControllerTests.swift
//  MovieTrackerTests
//
//  Created by Balita on 9/21/23.
//

import XCTest
@testable import MovieTracker

final class LibraryViewControllerTests: XCTestCase {
    
    var sut : LibraryViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
        _ = sut.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Check if nil
    func testLibraryVC_TableViewShouldNotBeNil(){
        XCTAssertNotNil(sut.libraryTableView)
    }
    
    // MARK: Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource(){
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService)
    }

}

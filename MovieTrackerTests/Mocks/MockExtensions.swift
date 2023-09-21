//
//  MockExtensions.swift
//  MovieTrackerTests
//
//  Created by Balita on 9/21/23.
//

import UIKit

@testable import MovieTracker


extension MovieLibraryDataServiceTests {
    class TableViewMock: UITableView {
        var cellDequeuedProperly = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MovieCellMock: MovieCell {
        var movieData: Movie?
        
        override func configMovieCell(movie: Movie){
            movieData = movie
        }
    }
}



//
//  Movie.swift
//  MovieTracker
//
//  Created by Balita on 9/21/23.
//

import Foundation


struct Movie{
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

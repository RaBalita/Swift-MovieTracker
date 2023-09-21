//
//  MovieManager.swift
//  MovieTracker
//
//  Created by Balita on 9/21/23.
//

import Foundation

class MovieManager {
    var moviesToSeeCount : Int { return moviesToSeeArray.count }
    var moviesSeenCount : Int { return moviesSeenArray.count }
    
    private var moviesToSeeArray = [Movie]()
    private var moviesSeenArray = [Movie]()  // :-)
    
    func AddMovie(movie: Movie){
        if !moviesToSeeArray.contains(movie){
            moviesToSeeArray.append(movie)
        }
    }
    
    func GetMovieAtIndex(_ index: Int) -> Movie {
        return moviesToSeeArray[index]
    }
    
    func CheckOffMovieAtIndex(_ index: Int) {
        guard index < moviesToSeeArray.count else {return}
        
        let checkedMovie = moviesToSeeArray.remove(at: index)
        moviesSeenArray.append(checkedMovie)
    }
    
    func GetMovieCheckedOffAtIndex(_ index: Int) -> Movie {
        return moviesSeenArray[index]
    }
    
    func ClearArrays(){
        moviesSeenArray.removeAll()
        moviesToSeeArray.removeAll()
    }
}

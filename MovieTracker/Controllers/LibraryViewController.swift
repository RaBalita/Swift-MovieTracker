//
//  ViewController.swift
//  MovieTracker
//
//  Created by Balita on 9/21/23.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        dataService.movieManager?.AddMovie(movie: Movie(title: "Gidragidra", releaseDate: "1995"))
        dataService.movieManager?.AddMovie(movie: Movie(title: "Horera", releaseDate: "1992"))
        dataService.movieManager?.AddMovie(movie: Movie(title: "Vampira", releaseDate: "1999"))
        dataService.movieManager?.AddMovie(movie: Movie(title: "Rosalinda", releaseDate: "2001"))
        dataService.movieManager?.AddMovie(movie: Movie(title: "Isaura", releaseDate: "1996"))
        dataService.movieManager?.AddMovie(movie: Movie(title: "Style sens du devoir", releaseDate: "1992"))
        
        libraryTableView.reloadData()
    }


}


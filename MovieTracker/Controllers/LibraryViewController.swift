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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.libraryTableView.dataSource = dataService
    }


}


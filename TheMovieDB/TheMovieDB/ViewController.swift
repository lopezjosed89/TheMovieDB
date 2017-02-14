//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var movieListed = [Movie]()
    private let movieApi = MovieAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        movieApi.retrieveMovieInfo(movieGroup: .nowPlaying){ movieResponse, error in
            switch movieResponse! {
            case .success(let movie): print(movie)
            case .failure("fallaste"): print("failed")
            default: break
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


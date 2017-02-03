//
//  MoviAPI.swift
//  TheMovieDB
//
//  Created by Jose Daniel Lopez Franco on 1/31/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation
import Alamofire


typealias MoviesHandler = (_ movieResponse : Response?, _ error: NSError?) -> Void

class MovieAPI {
    
    private let movieService = MovieService()

    
    func retrieveMovieInfo(movieGroup: MovieGroup, completionHandler : @escaping MoviesHandler){
        movieService.RetrieveInfo(movieGroup: movieGroup, completionHandler: completionHandler)
    
        
    }
}

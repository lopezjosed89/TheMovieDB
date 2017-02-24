//
//  FavoritesMovies.swift
//  TheMovieDB
//
//  Created by Jose Daniel Lopez Franco on 2/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation


import Foundation

protocol FavoritesProtocol {
    var favoriteMovies: [Movie]{get set}
    
    func addMovieToFavorites()
    func getFavoritesMovies()
    
}

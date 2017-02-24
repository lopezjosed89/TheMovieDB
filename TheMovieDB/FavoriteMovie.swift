//
//  FavoriteMovie.swift
//  TheMovieDB
//
//  Created by Jose Daniel Lopez Franco on 2/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

class FavoriteMovie: NSObject, FavoritesProtocol, NSCoding {
    internal var favoriteMovies: [Movie]
    
    required init?(coder aDecoder: NSCoder) {
        self.favoriteMovies = aDecoder.decodeObject(forKey: "favoriteMovies") as! [Movie]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.favoriteMovies, forKey: "favoriteMovies")
    }
    internal func getFavoritesMovies() {
        
    }

    internal func addMovieToFavorites() {
        
    }

    

    
}

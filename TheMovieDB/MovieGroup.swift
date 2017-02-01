//
//  MovieGroup.swift
//  TheMovieDB
//
//  Created by Jose Daniel Lopez Franco on 1/30/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

enum MovieGroup {
    case Latest
    case TopRated
    case NowPlaying
    case Popular
    case UpComing
}

func moviePath(moviegroup:MovieGroup)->String{
    switch moviegroup {
    case .NowPlaying: return "https://api.themoviedb.org/3/movie/upcoming?"
    case .Popular: return "https://api.themoviedb.org/3/movie/upcoming?"
    case .Latest: return "https://api.themoviedb.org/3/movie/upcoming?"
    case .TopRated: return "https://api.themoviedb.org/3/movie/upcoming?"
    case .UpComing: return "https://api.themoviedb.org/3/movie/upcoming?"
        
    }
}

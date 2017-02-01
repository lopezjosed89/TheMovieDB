//
//  MovieGroup.swift
//  TheMovieDB
//
//  Created by Jose Daniel Lopez Franco on 1/30/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

enum MovieGroup {

    case TopRated
    case NowPlaying
    case Popular
    case UpComing
}

func moviePath(moviegroup:MovieGroup)->String{
    
    switch moviegroup {
    case .NowPlaying: return "https://api.themoviedb.org/3/movie/now_playing?api_key=a86dbf84324001b2221400d5f138500c&language=en-US&page=1"
    case .Popular: return "https://api.themoviedb.org/3/movie/popular?api_key=a86dbf84324001b2221400d5f138500c&language=en-US&page=1"
    case .TopRated: return "https://api.themoviedb.org/3/movie/top_rated?api_key=a86dbf84324001b2221400d5f138500c&language=en-US&page=1"
    case .UpComing: return "https://api.themoviedb.org/3/movie/upcoming?api_key=a86dbf84324001b2221400d5f138500c&language=en-US&page=1"
        
    }
}
 

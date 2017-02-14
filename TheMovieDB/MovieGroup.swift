//
//  MovieGroup.swift
//  TheMovieDB
//
//  Created by Jose Daniel Lopez Franco on 1/30/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation



enum MovieGroup {
    
    case topRated, nowPlaying, popular, upComing
}
extension MovieGroup{
    var url: String {
        switch self {
        case .nowPlaying: return "https://api.themoviedb.org/3/movie/now_playing?"
        case .popular: return "https://api.themoviedb.org/3/movie/popular?"
        case .topRated: return "https://api.themoviedb.org/3/movie/top_rated?"
        case .upComing: return "https://api.themoviedb.org/3/movie/upcoming?"
        }
    }
}


//
//  MovieResponse.swift
//  TheMovieDB
//
//  Created by Jose Daniel Lopez Franco on 1/31/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

enum Response {
    case success([String: Any])
    case failure(String)

}

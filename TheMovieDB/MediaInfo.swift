//
//  MediaInfo.swift
//  TheMovieDB
//
//  Created by Jose Daniel Lopez Franco on 1/30/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

protocol MediaInfo {
    var id:Int?{get}
    var title:String?{get}
    var releaseDate:String?{get}
    var description:String?{get}
    var rating:Double?{get}
    var picture:String?{get}
}

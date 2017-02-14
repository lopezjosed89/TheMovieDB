//
//  Movie.swift
//  TheMovieDB
//
//  Created by Jose Daniel Lopez Franco on 1/30/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation


struct Movie: MediaInfo{
    var id:Int?
    var title:String?
    var releaseDate: String?
    var description:String?
    var rating:Double?
    var picture:String?
    
    init(id:Int, title:String, releaseDate:String, description:String, rating:Double, picture:String){
        self.description = description
        self.id = id
        self.picture = picture
        self.rating = rating
        self.title = title
        self.releaseDate = releaseDate
        
    }

}

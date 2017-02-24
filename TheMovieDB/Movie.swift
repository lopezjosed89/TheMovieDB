//
//  Movie.swift
//  TheMovieDB
//
//  Created by Jose Daniel Lopez Franco on 1/30/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation



class Movie: NSObject, MediaInfo, NSCoding {
    var id:Int?
    var title:String?
    var releaseDate: String?
    var overview:String?
    var rating:Double?
    var picture:String?
    
    init(id:Int, title:String, releaseDate:String, overview:String, rating:Double, picture:String){
        self.overview = overview
        self.id = id
        self.picture = picture
        self.rating = rating
        self.title = title
        self.releaseDate = releaseDate
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.overview = aDecoder.decodeObject(forKey: "overview") as! String?
        self.id = aDecoder.decodeObject(forKey: "id") as! Int?
        self.picture = (aDecoder.decodeObject(forKey: "picture") as! String)
        self.rating = aDecoder.decodeObject(forKey: "rating") as! Double?
        self.releaseDate = aDecoder.decodeObject(forKey:"releaseDate") as! String?
        self.title = aDecoder.decodeObject(forKey:"title") as! String?
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.overview, forKey: "overview")
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.picture, forKey: "picture")
        aCoder.encode(self.rating, forKey: "rating")
        aCoder.encode(self.releaseDate, forKey: "releaseDate")
        aCoder.encode(self.title, forKey: "title")
    }
    
    

}


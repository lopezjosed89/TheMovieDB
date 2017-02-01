//
//  MovieService.swift
//  TheMovieDB
//
//  Created by Jose Daniel Lopez Franco on 1/31/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation
import Alamofire

let url = MovieGroup.NowPlaying


func requestMovie(url: String, completion: @escaping (_ result: String) -> Void) -> Void {
    
    Alamofire.request(url).responseJSON { (response) -> Void in
       // check if has a value
        if let JSON = response.result.value {
            
            jsonParser(JSON: JSON)
            completion("Done")
            
        }
        
    }
}


func jsonParser(JSON: Any) -> Void {
    
    if let dictionary = JSON as? [String: Any]{
        
        if let nestedDictionary = dictionary["results"] as? [[String: Any]]{
            for result in nestedDictionary {
                
                print(result["title"]!)
            }
        }
    }
}


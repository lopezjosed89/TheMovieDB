//
//  MovieService.swift
//  TheMovieDB
//
//  Created by Jose Daniel Lopez Franco on 1/31/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation
import Alamofire

class MovieService {


    
func RetrieveInfo(movieGroup : MovieGroup, completionHandler : @escaping MoviesHandler){
        
        let url =  "\(movieGroup.Url)"+AppKeys.apiKey  //pasar la url como parametro

    
        Alamofire.request(url).responseJSON{
            
            response in
            guard let json = response.result.value as? [String: AnyObject]
                
                else {
                    
                    completionHandler(nil, response.result.error as NSError?)
                    return
            }
            
             let movies = self.jsonParser(JSON: json)
            completionHandler(.success(movies), nil)
        }
        
    }
    
    func jsonParser(JSON: Any) -> [Movie] {
    var movies = [Movie]()
    if let dictionary = JSON as? [String: Any]{
        
        if let nestedDictionary = dictionary["results"] as? [[String: Any]]{
            for result in nestedDictionary {
                let id = result["id"] as! Int,
                title = result["title"] as! String,
                releaseDate = result["release_date"] as! String,
                description = result["overview"] as! String,
                rating = result["vote_average"] as! Double,
                picture = result["poster_path"] as! String
                let posterURL = "https://image.tmdb.org/t/p/w500/"+picture
                let movie = Movie.init(id: id, title: title, releaseDate: releaseDate, description: description, rating: rating, picture: posterURL)
                
                movies.append(movie)
                //print(movie.title!)
            }
        }
    }
        
        return movies
       
}
}



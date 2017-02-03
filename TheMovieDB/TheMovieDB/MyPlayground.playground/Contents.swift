//: Playground - noun: a place where people can play

import UIKit
import Alamofire
import PlaygroundSupport




//PlaygroundPage.current.needsIndefiniteExecution = true




let nowPlaying = "https://api.themoviedb.org/3/movie/now_playing?api_key=a86dbf84324001b2221400d5f138500c&language=en-US&page=1"
let popular = "https://api.themoviedb.org/3/movie/popular?api_key=a86dbf84324001b2221400d5f138500c&language=en-US&page=1"
let topRated = "https://api.themoviedb.org/3/movie/top_rated?api_key=a86dbf84324001b2221400d5f138500c&language=en-US&page=1"
let upComing = "https://api.themoviedb.org/3/movie/upcoming?api_key=a86dbf84324001b2221400d5f138500c&language=en-US&page=1"



func jsonParser(JSON: Any) -> Void {

    if let dictionary = JSON as? [String: Any]{
    
        if let nestedDictionary = dictionary["results"] as? [[String: Any]]{
            for result in nestedDictionary {
            
                print(result["poster_path"]!)
            }
        }
    }
}


func requestMovie(upComing: String) -> Void {
    
    Alamofire.request(upComing).responseJSON { (response) -> Void in
        
        // check if has a value
        if let JSON = response.result.value {
            
            jsonParser(JSON: JSON)
            print(JSON)
    
            
        }
         PlaygroundPage.current.finishExecution()
    }
}

requestMovie(upComing: upComing)






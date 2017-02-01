//: Playground - noun: a place where people can play

import UIKit
import Alamofire
import PlaygroundSupport




PlaygroundPage.current.needsIndefiniteExecution = true


protocol MediaInfo {
    var id:Int?{get}
    var title:String?{get}
    var releaseDate:NSDate?{get}
    var description:String?{get}
    var rating:Double?{get}
    var picture:String?{get}
    
}


class Movie: MediaInfo{
    var id:Int?
    var title:String?
    var releaseDate: NSDate?
    var description:String?
    var rating:Double?
    var picture:String?
    
    init(id:Int, title:String, releaseDate:NSDate, description:String, rating:Double, picture:String){
        self.description = description
        self.id = id
        self.picture = picture
        self.rating = rating
        self.title = title
        self.releaseDate = releaseDate
        
    }
    
}


let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=a86dbf84324001b2221400d5f138500c&language=en-US&page=1"
var movies: [Movie] = []



func jsonParser(JSON: Any) ->Void{
    //print("JSON:\(JSON)")
    
    if let dictionary = JSON as? [String: Any]{
    
        if let nestedDictionary = dictionary["results"] as? [[String: Any]]{
            //print(nestedDictionary)
            
            for result in nestedDictionary {
            
                print(result["title"]!)
                
            }
        }
    }
    
    
    
    
    
}


func requestMovie(url: String) -> Void {
    
    Alamofire.request(url).responseJSON { (response) -> Void in
        
        // check if has a value
        if let JSON = response.result.value {
            
            jsonParser(JSON: JSON)
    
            
        }
         PlaygroundPage.current.finishExecution()
    }
}

requestMovie(url: url)




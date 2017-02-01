//: Playground - noun: a place where people can play

import UIKit
import Alamofire
import PlaygroundSupport






Alamofire.request("https://api.themoviedb.org/3/movie/latest?api_key=a86dbf84324001b2221400d5f138500c&language=en-US")

Alamofire.request("https://httpbin.org/get").responseJSON { response in
    print(response.request)  // original URL request
    print(response.response) // HTTP URL response
    print(response.data)     // server data
    print(response.result)   // result of response serialization
    
    if let JSON = response.result.value {
        print("JSON: \(JSON)")
    }
}

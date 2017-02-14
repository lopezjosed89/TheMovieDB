//
//  MoviesTableViewController.swift
//  TheMovieDB
//
//  Created by Jose Daniel Lopez Franco on 2/3/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesTableViewController: UIViewController, MyListDataSource {
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var myListView: MyListView!
    
    
    var movieListed = [Movie]()
    private let movieApi = MovieAPI()
    
    override func viewDidLoad() {
        let myView = MyListDataSource()
        
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Add background to the tableView
        tableView.backgroundView = UIImageView(image: UIImage(named: "pexels-photo-27008.jpg"))
        
        movieApi.retrieveMovieInfo(movieGroup: .nowPlaying){ movieResponse, error in
            switch movieResponse! {
            case .success(let movie):
                self.movieListed = movie
                self.tableView.reloadData()
            case .failure("fail"): print("failed")
            default: break
            }
        }
        super.viewWillAppear(true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieListed.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaTableViewCell
        let movie = movieListed[indexPath.row]
        cell.layer.cornerRadius = 8
        
        // Configure the cell...
        cell.titleLabel.text = movie.title
        cell.posterImage.af_setImage(withURL: URL(string: movie.picture!)!)
        return cell
    }
}

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
    
    internal func configureCell(cell: MyCell, indexPath: IndexPath) {
        let movie = movieListed[indexPath.row]
        cell.labelTitle?.text = movie.title
        cell.posterView?.af_setImage(withURL: URL(string: movie.picture!)!)
    }

    internal func getItems() -> Int {
        return movieListed.count
    }
    //@IBOutlet weak var backGroundImg: UIImageView!
    @IBOutlet var containerView: UIView!
    var myListView: MyListView!
    var movieListed = [Movie]()
    private let movieApi = MovieAPI()
    
    override func viewDidLoad() {
        let view = MyTableView()
        
        self.myListView = view
        view.myListDelegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(view)
        
        let margins = containerView.layoutMarginsGuide
        
        view.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .topMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0).isActive = true
        
        
        
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Add background to the tableView
        movieApi.retrieveMovieInfo(movieGroup: .nowPlaying){ movieResponse, error in
            switch movieResponse! {
            case .success(let movie):
                self.movieListed = movie
                self.myListView.handleDataReload()
            case .failure("fail"): print("failed")
            default: break
            }
        }
        super.viewWillAppear(true)
        
    }
}

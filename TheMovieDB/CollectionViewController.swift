//
//  CollectionViewController.swift
//  Example
//
//  Created by Jaime Laino on 2/9/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class CollectionViewController: UIViewController, UICollectionViewDelegate {
    
    var movieListed = [Movie]()
    private let movieApi = MovieAPI()
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let identifier = String(describing: MyCollectionViewCell.self)
        let nib = UINib(nibName: identifier, bundle: nil)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: 100, height: 150)
        layout.scrollDirection = .vertical
    
    }
    override func viewWillAppear(_ animated: Bool) {
        collectionView.backgroundView = UIImageView(image: UIImage(named: "pexels-photo-27008.jpg"))
        movieApi.retrieveMovieInfo(movieGroup: .nowPlaying){ movieResponse, error in
            switch movieResponse! {
            case .success(let movie):
                self.movieListed = movie
                self.collectionView.reloadData()
            case .failure("fail"): print("failed")
            default: break
            }
        }
        super.viewWillAppear(true)

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("\(movieListed.count) veces")
        return movieListed.count
        
    }
    

    
}



extension CollectionViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = String(describing: MyCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MyCollectionViewCell
        let movie = movieListed[indexPath.row]
        cell.myLabel.text = movie.title
        cell.posterImage.af_setImage(withURL: URL(string: movie.picture!)!)
        cell.layer.cornerRadius = 8
        return cell
    }
    
    
}

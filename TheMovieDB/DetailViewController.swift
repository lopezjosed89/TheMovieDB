//
//  DetailViewController.swift
//  TheMovieDB
//
//  Created by Jose Daniel Lopez Franco on 2/20/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation
import UIKit


class DetailViewController: UIViewController {
    @IBOutlet var detailTitle : UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    
    var peli:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTitle.text = peli?.title
        detailImage.af_setImage(withURL: URL(string: (peli?.picture)!)!)
    }
    
}

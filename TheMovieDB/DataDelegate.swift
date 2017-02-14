//
//  DataDelegate.swift
//  TheMovieDB
//
//  Created by Jose Daniel Lopez Franco on 2/10/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation
import UIKit

protocol MyListDataSource:class {
    func getItems() ->Int
    func configureCell(_: MyCell)
}

protocol MyCell {
    var labelTitle: UILabel? {get set}
    var posterView: UIImageView? {get set}
}

protocol MyListView{
    weak var myListDelegate: MyListDataSource? {get set}
    func handleDataReload()
}


class MyTableView: UITableView, MyListView{
    internal func handleDataReload() {
       self.reloadData()
    }

    weak var myListDelegate: MyListDataSource?
    
   }

extension MyTableView:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (myListDelegate?.getItems())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaTableViewCell
        cell.layer.cornerRadius = 8
        myListDelegate?.configureCell(cell as! MyCell)
        return cell
    }
}

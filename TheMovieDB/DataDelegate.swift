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
    func configureCell(cell: MyCell, indexPath: IndexPath)
}

protocol MyCell {
    var labelTitle: UILabel! {get set}
    var posterView: UIImageView! {get set}
}

protocol MyListView{
    weak var myListDelegate: MyListDataSource? {get set}
    func handleDataReload()
}


class MyTableView: UITableView, MyListView {
    internal func handleDataReload() {
       self.reloadData()
    }
    let identifier = String(describing: MyTableViewCell.self)

    weak var myListDelegate: MyListDataSource?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        initRegister()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initRegister()
    }
    
    func initRegister() {
        let nib = UINib(nibName: identifier, bundle: nil)
        self.dataSource = self
        self.register(nib, forCellReuseIdentifier: identifier)
        rowHeight = 150
        backgroundColor = nil
    }
}

extension MyTableView:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (myListDelegate?.getItems())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MyTableViewCell
        cell.layer.cornerRadius = 8
        myListDelegate?.configureCell(cell: cell as MyCell, indexPath: indexPath)
        return cell
    }
}

//
//  ViewController.swift
//  AboutCanada
//
//  Created by Ayan Khan on 03/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import UIKit
class FactsViewController: UIViewController {
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    let cellID = "cellIdentifier"
    
    override func loadView() {
        super.loadView()
        safeArea = view.layoutMarginsGuide
        setupTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func setupTableView() {
       view.addSubview(tableView)
        
       //Add Top,Leading,Bottom,Trailing Constraint to Safe Area
       tableView.translatesAutoresizingMaskIntoConstraints = false
       tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
       tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
       tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
       tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    
       //Register TableViewCell
       tableView.register(FactsTableViewCell.self, forCellReuseIdentifier: cellID)
        
       //TableViewCell Dynamic Height
       tableView.estimatedRowHeight = 80.0
       tableView.rowHeight = UITableView.automaticDimension


    }

}


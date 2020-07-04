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
    
    let dataSource = FactsDataSource()
    
    lazy var viewModel : FactsViewModel = {
        let viewModel = FactsViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func loadView() {
        super.loadView()
        safeArea = view.layoutMarginsGuide
        setupTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Fetching Facts..."

        //Observe Service Response
        self.tableView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.tableView.reloadData()
            self?.title = self?.dataSource.data.title
        }
        
        //Error Handling
        self.viewModel.onErrorHandling = { [weak self] error in
            // display error ?
            let controller = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            self?.present(controller, animated: true, completion: nil)
        }
        
        //Call Fetch Facts Webservice
        self.viewModel.fetchFacts()

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
       tableView.register(FactsTableViewCell.self, forCellReuseIdentifier: FactsTableViewCell.cellId)
        
       //TableViewCell Dynamic Height
       tableView.estimatedRowHeight = 120.0
       tableView.rowHeight = UITableView.automaticDimension
        
       //To Avoid Extra Cells
       tableView.tableFooterView = UIView()


    }

}


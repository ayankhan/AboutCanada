//
//  ViewController.swift
//  AboutCanada
//
//  Created by Ayan Khan on 03/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import UIKit
class FactsViewController: UIViewController {
    private let tableView = UITableView()
    private var safeArea: UILayoutGuide!
    
    private let dataSource = FactsDataSource()
    
    private lazy var viewModel : FactsViewModel = {
        let viewModel = FactsViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
                     #selector(FactsViewController.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        return refreshControl
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
            if self?.refreshControl.isRefreshing ?? false{
                self?.refreshControl.endRefreshing()
            }
        }
        
        //Error Handling
        self.viewModel.onErrorHandling = { [weak self] error in
            if self?.refreshControl.isRefreshing ?? false{
                self?.refreshControl.endRefreshing()
                self?.title = ""
            }

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
        
       //Add PullToRefresh
       tableView.addSubview(self.refreshControl)

    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.title = "Refreshing Facts..."
        
        //Adding delay intentionally so that PullToReresh can be checked otherwise it's too fast that one is unable to guess what's happening
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.viewModel.fetchFacts()
        }

    }
}


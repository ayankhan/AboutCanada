//
//  FactsDatasourceTests.swift
//  AboutCanadaTests
//
//  Created by Ayan Khan on 05/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import XCTest
@testable import AboutCanada

class FactsDatasourceTests: XCTestCase {

    var dataSource : FactsDataSource!
    
    override func setUp() {
        super.setUp()
        dataSource = FactsDataSource()
    }
    
    override func tearDown() {
        dataSource = nil
        super.tearDown()
    }
    
    func testEmptyValueInDataSource() {
        
        // giving empty data value
        dataSource.data.value = []
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        // expected one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")
        
        // expected zero cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
    }
    
    func testValueInDataSource() {
        
        // Providing data value
        let flag = Fact.init(factTitle: "Flag", factDescription: "Test Description", factImage: "")
        let beavers = Fact.init(factTitle: "Beavers", factDescription: "Test Description", factImage: "")
        dataSource.data.value = [flag, beavers]
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        // expected one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")
        
        // expected two cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 2, "Expected two cell in table view")
    }
    
    func testValueCell() {
        
        // giving data value
        let flag = Fact.init(factTitle: "Flag", factDescription: "Test Description", factImage: "")
        dataSource.data.value = [flag]
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.register(FactsTableViewCell.self, forCellReuseIdentifier: FactsTableViewCell.cellId)
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        // expected FactsTableViewCell class
        guard let _ = dataSource.tableView(tableView, cellForRowAt: indexPath) as? FactsTableViewCell else {
            XCTAssert(false, "Expected CurrencyCell class")
            return
        }
    }

}

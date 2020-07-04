//
//  FactsDataSource.swift
//  AboutCanada
//
//  Created by Ayan Khan on 04/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<T,String> : NSObject {
    var data: DynamicValue<[T],String> = DynamicValue([],"" as! String)
}

class FactsDataSource: GenericDataSource<Fact,String>, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = FactsTableViewCell(style: .default,
                                 reuseIdentifier: FactsTableViewCell.cellId)
        
        let fact = data.value[indexPath.row]

        cell.populateCell(data:fact)
        
        return cell
    }
    

}


//
//  FactsDataSource.swift
//  AboutCanada
//
//  Created by Ayan Khan on 04/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import Foundation

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class FactsDataSource: GenericDataSource<Fact> {
    
}


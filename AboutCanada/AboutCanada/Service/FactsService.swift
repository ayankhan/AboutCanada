//
//  FactsService.swift
//  AboutCanada
//
//  Created by Ayan Khan on 04/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import Foundation

protocol FactsServiceProtocol : class {
    func fetchFacts(_ completion: @escaping ((Result<About, ErrorResult>) -> Void))
}

final class FactsService : RequestHandler, FactsServiceProtocol {
    
    static let shared = FactsService()
    
    let endpoint = "https://dl.dropboxusercontent.com/s/67zezivdylh8flh/Facts.json"
    var task : URLSessionTask?
    
    func fetchFacts(_ completion: @escaping ((Result<About, ErrorResult>) -> Void)) {
        
        // Cancel previous request if already in progress
        self.cancelFetchFacts()
        
        task = RequestService().loadData(urlString: endpoint, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchFacts() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}

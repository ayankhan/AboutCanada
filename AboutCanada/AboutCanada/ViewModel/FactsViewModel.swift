//
//  FactsViewModel.swift
//  AboutCanada
//
//  Created by Ayan Khan on 04/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import Foundation

struct FactsViewModel {
    
    weak var dataSource : GenericDataSource<Fact,String>?
    weak var service: FactsServiceProtocol?
    
    var onErrorHandling : ((ErrorResult?) -> Void)?
    
    init(service: FactsServiceProtocol = FactsService.shared, dataSource : GenericDataSource<Fact,String>?) {
        self.dataSource = dataSource
        self.service = service
    }
    
    func fetchFacts() {
        
        guard let service = service else {
            onErrorHandling?(ErrorResult.custom(string: "Missing service"))
            return
        }
        
        service.fetchFacts { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let about) :
                    self.dataSource?.data.value = about.facts
                    self.dataSource?.data.title = about.screenTitle
                case .failure(let error) :
                    self.onErrorHandling?(error)
                }
            }
        }
    }
}

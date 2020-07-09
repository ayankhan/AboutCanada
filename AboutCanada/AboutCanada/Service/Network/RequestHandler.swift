//
//  RequestHandler.swift
//  AboutCanada
//
//  Created by Ayan Khan on 04/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import Foundation

class RequestHandler {
        
    func networkResult(completion: @escaping ((Result<About, ErrorResult>) -> Void)) ->
        ((Result<Data, ErrorResult>) -> Void) {
            
            return { dataResult in 
                
                DispatchQueue.global(qos: .background).async(execute: { 
                    switch dataResult {
                    case .success(let data) :
                        do {
                            let result = try JSONDecoder().decode(About.self, from: data)
                            completion(.success(result))
                        } catch {
                            completion(.failure(.parser(string: "Parsing Error: " + error.localizedDescription)))
                        }
                        break
                    case .failure(let error) :
                        print("Network error \(error)")
                        completion(.failure(.network(string: "Network Error: " + error.localizedDescription)))
                        break
                    }
                })
                
            }
    }
    
}

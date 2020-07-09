//
//  File.swift
//  AboutCanada
//
//  Created by Ayan Khan on 04/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
extension ErrorResult: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .network(let message):
            return NSLocalizedString(message, comment: "Network Error")
        case .parser(let message):
            return NSLocalizedString(message, comment: "Parsing Error")
        case .custom(let message):
            return NSLocalizedString(message, comment: "Error")
        }
    }
}

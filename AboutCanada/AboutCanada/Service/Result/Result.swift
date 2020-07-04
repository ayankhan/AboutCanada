//
//  Result.swift
//  AboutCanada
//
//  Created by Ayan Khan on 04/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import Foundation

enum Result<About, E: Error> {
    case success(About)
    case failure(E)
}

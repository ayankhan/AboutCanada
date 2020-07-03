//
//  About.swift
//  AboutCanada
//
//  Created by Ayan Khan on 04/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import Foundation

struct About: Codable {
    var screenTitle : String
    var facts : [Fact]
    
    enum CodingKeys: String, CodingKey {
        case screenTitle = "title"
        case facts = "rows"
    }
    
}

//
//  Fact.swift
//  AboutCanada
//
//  Created by Ayan Khan on 04/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import Foundation

struct Fact: Codable {
    var factTitle : String
    var factDescription : String
    var factImage : String
    
    enum CodingKeys: String, CodingKey {
        case factTitle = "title"
        case factDescription = "description"
        case factImage = "imageHref"
    }
}

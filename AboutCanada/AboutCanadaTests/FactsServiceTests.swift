//
//  FactsServiceTests.swift
//  AboutCanadaTests
//
//  Created by Ayan Khan on 05/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import XCTest
@testable import AboutCanada

class FactsServiceTests: XCTestCase {
    
    func testCancelRequest() {
        
        // giving a "previous" session
        FactsService.shared.fetchFacts { (_) in
            // ignore call
        }
        
        // Expected to task nil after cancel
        FactsService.shared.cancelFetchCurrencies()
        XCTAssertNil(FactsService.shared.task, "Expected task nil")
    }

}

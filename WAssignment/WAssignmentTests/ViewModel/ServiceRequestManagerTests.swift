//
//  ServiceRequestManagerTests.swift
//  WAssignmentTests
//
//  Created by Hemant on 20/07/20.
//  Copyright © 2020 Hemant. All rights reserved.
//

import XCTest
@testable import WAssignment

class ServiceRequestManagerTests: XCTestCase {
    
    var factServiceRequestManager: FactServiceRequestManager?
    
    override func setUp() {
        factServiceRequestManager = FactServiceRequestManager()
    }

    func test_fetch_fact_data() {
        let expectation = self.expectation(description: "API Response")
        var responseError: Error?
        var responseData: FactDataModel?
        factServiceRequestManager?.fetchData(result: { (factDataModel, error) in
            responseError = error
            responseData = factDataModel
            expectation.fulfill()
        })

        waitForExpectations(timeout: 10, handler: nil)
        if responseError != nil {
            XCTAssertNil(responseData)
        } else {
            XCTAssertNotNil(responseData)
        }
    }
}

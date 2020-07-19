//
//  FactDataViewModelTests.swift
//  WAssignmentTests
//
//  Created by Hemant on 20/07/20.
//  Copyright © 2020 Hemant. All rights reserved.
//

import XCTest
@testable import WAssignment

class FactDataViewModelTests: XCTestCase {
    
    var factDataViewModel: FactDataViewModel?
    
    override func setUp() {
        factDataViewModel = FactDataViewModel()
        XCTAssertNotNil(factDataViewModel!.title)
        XCTAssertNotNil(factDataViewModel!.rows)
    }

    func test_fetchData() {
        let expectation = self.expectation(description: "API Response")
        var responseError: Error?
        factDataViewModel?.fetchData(result: { (error) in
            responseError = error
            expectation.fulfill()
        })
        waitForExpectations(timeout: 10, handler: nil)
        if responseError != nil {
            XCTAssertTrue(factDataViewModel!.rows.count == 0)
        } else {
            XCTAssertTrue(factDataViewModel!.rows.count > 0)
        }
    }
}

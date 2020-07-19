//
//  WebRequestManagerTests.swift
//  WAssignmentTests
//
//  Created by Hemant on 20/07/20.
//  Copyright © 2020 Hemant. All rights reserved.
//

import XCTest
@testable import WAssignment

class WebRequestManagerTests: XCTestCase {
    var webRequestManager: WebRequestManager?
    
    override func setUp() {
        webRequestManager = WebRequestManager()
    }

    func test_api_call() {
        let expectation = self.expectation(description: "API Response")
        var responseError: Error?
        var responseData: Data?
        var apiResponse: URLResponse?
        
        let urlString = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        webRequestManager?.request(urlString: urlString, method: .get, result: { (data, response, error) in
            responseError = error
            responseData = data
            apiResponse = response
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 10, handler: nil)
        if responseError != nil {
            XCTAssertNil(responseData)
        } else {
            XCTAssertNotNil(responseData)
            XCTAssertNotNil(apiResponse)
        }
    }
}

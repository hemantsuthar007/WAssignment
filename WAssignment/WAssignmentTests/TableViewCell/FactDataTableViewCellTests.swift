//
//  FactDataTableViewCellTests.swift
//  WAssignmentTests
//
//  Created by Hemant on 20/07/20.
//  Copyright © 2020 Hemant. All rights reserved.
//

import XCTest
@testable import WAssignment

class FactDataTableViewCellTests: XCTestCase {
    
    private var factDataTableViewCell : FactDataTableViewCell?
    
    override func setUp() {
        super.setUp()
        factDataTableViewCell = FactDataTableViewCell()
        factDataTableViewCell!.setupUI()
    }
    
    func test_loadCellData() {
        let rowData = RowDataModel(title: "title", description: "description", imageHref: "urlstring")
        XCTAssertNotNil(factDataTableViewCell!.loadCellData(rowData: rowData))
        XCTAssertEqual(factDataTableViewCell!.titleLabel.text, rowData.title)
        XCTAssertEqual(factDataTableViewCell!.descriptionLabel.text, rowData.description)
        XCTAssertNotNil(factDataTableViewCell!.dataImageView.image)
    }
}

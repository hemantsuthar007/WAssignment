//
//  HomeViewControllerTests.swift
//  WAssignmentTests
//
//  Created by Hemant on 19/07/20.
//  Copyright © 2020 Hemant. All rights reserved.
//

import XCTest
@testable import WAssignment

class HomeViewControllerTests: XCTestCase {
    var homeViewController: HomeViewController?
    var navigationController: UINavigationController?
    
    override func setUp() {
        super.setUp()
        homeViewController = HomeViewController()
        XCTAssertNotNil(homeViewController!.refreshControl)
    }

    func test_setupUI() {
        XCTAssertNotNil(homeViewController!.setupUI())
    }

    func test_fetch_data(){
        homeViewController!.setupUI()
        XCTAssertNotNil(homeViewController!.retriveData())
        XCTAssertNotNil(homeViewController!.refreshData())
    }

    func test_tableView() {
        homeViewController?.setupUI()
        XCTAssertNotNil(homeViewController!.factDataTableView)
        XCTAssertNotNil(homeViewController!.factDataTableView.dataSource)
    }

    func test_tableViewCell() {
        homeViewController?.setupUI()
        homeViewController?.viewModel.factDataModel = FactDataModel(title: "Title",
                                                                    rows: [RowDataModel(title: "title",
                                                                                        description: "description",
                                                                                        imageHref: "urlstring")])
        homeViewController?.factDataTableView.reloadData()
        let cells = homeViewController!.factDataTableView.visibleCells as! [FactDataTableViewCell]
        XCTAssertTrue(cells.count > 0)
    }
}

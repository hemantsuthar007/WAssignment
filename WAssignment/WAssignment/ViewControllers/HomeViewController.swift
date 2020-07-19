//
//  HomeViewController.swift
//  WAssignment
//
//  Created by Hemant on 18/07/20.
//  Copyright © 2020 Hemant. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // Variables
    var factDataTableView: UITableView!
    private var viewModel = FactDataViewModel()
    
    // Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        setupUI()
    }

    // setup UI
    private func setupUI() {
        factDataTableView = UITableView(frame: view.bounds)
        factDataTableView.backgroundColor = .red
        view.addSubview(factDataTableView)
        factDataTableView.dataSource = self
        factDataTableView.register(FactDataTableViewCell.self, forCellReuseIdentifier: "CellIdentofier")
        factDataTableView.rowHeight = UITableView.automaticDimension
        factDataTableView.estimatedRowHeight = UITableView.automaticDimension
        
        factDataTableView.translatesAutoresizingMaskIntoConstraints = false
        factDataTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        factDataTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        factDataTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        factDataTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        viewModel.factDataModel.dataList = [RowDataModel(title: "Beavers",
                                                        description: "Beavers a",
                                                        imageHref: "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"),
                                           RowDataModel(title: "Flag",
                                                        description: "It is a well known fact that polar bears are the main mode of transportation in Canada. They consume far less gas and have the added benefit of being difficult to steal.",
                                                        imageHref: "http://1.bp.blogspot.com/_VZVOmYVm68Q/SMkzZzkGXKI/AAAAAAAAADQ/U89miaCkcyo/s400/the_golden_compass_still.jpg")]
        factDataTableView.reloadData()
    }
}

// MARK:- TableView DataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentofier", for: indexPath) as! FactDataTableViewCell
        cell.loadCellData(rowData: viewModel.dataList[indexPath.row])
        return cell
    }
}

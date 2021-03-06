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
    var viewModel = FactDataViewModel()
    var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refreshControl
    }()

    // Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = viewModel.title
        setupUI()
        retriveData()
    }

    // setup UI
    func setupUI() {
        factDataTableView = UITableView(frame: view.bounds)
        view.addSubview(factDataTableView)
        factDataTableView.allowsSelection = false
        factDataTableView.dataSource = self
        factDataTableView.register(FactDataTableViewCell.self, forCellReuseIdentifier: "CellIdentofier")
        factDataTableView.rowHeight = UITableView.automaticDimension
        factDataTableView.estimatedRowHeight = UITableView.automaticDimension
        
        factDataTableView.translatesAutoresizingMaskIntoConstraints = false
        factDataTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        factDataTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        factDataTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        factDataTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        factDataTableView.addSubview(refreshControl)
        factDataTableView.reloadData()
    }

    func retriveData() {
        title = "Loading..."
        viewModel.fetchData {[unowned self] (error) in
            DispatchQueue.main.async {
                self.stopRefreshing()
                guard error == nil else {
                    self.title = "Failed to load!"
                    self.showAlert(title: "Error!", message: error?.localizedDescription)
                    return
                }
                self.title = self.viewModel.title
                self.factDataTableView.reloadData()
            }
        }
    }

    private func showAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

    @objc func refreshData() {
        retriveData()
    }

    private func stopRefreshing() {
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
        }
    }
}

// MARK:- TableView DataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentofier", for: indexPath) as! FactDataTableViewCell
        cell.loadCellData(rowData: viewModel.rows[indexPath.row])
        return cell
    }
}

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
    
    // Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Got it"
        // Do any additional setup after loading the view.
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
        
        
        factDataTableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK:- TableView DataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentofier", for: indexPath) as! FactDataTableViewCell
        cell.dataImageView.backgroundColor = .blue
        cell.titleLabel.text = "This is the sameple one"
        cell.descriptionLabel.text = "This is the sameple oneThis is the sameple oneThis is the sameple one \n This is the sameple one \nThis is the sameple one"
        cell.contentView.backgroundColor = .yellow
        return cell
    }
}

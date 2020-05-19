//
//  ViewController.swift
//  GitHubRepoList
//
//  Created by Satoshi Watanabe on 2020/05/19.
//  Copyright © 2020 Satoshi Watanabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let apiService = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiService.fetchRepos(table: tableView, datasource: tableView.dataSource as! RepoListDataSource)
    }
}


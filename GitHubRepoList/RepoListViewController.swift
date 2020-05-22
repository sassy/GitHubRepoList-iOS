//
//  RepoListViewController.swift
//  GitHubRepoList
//
//  Created by Satoshi Watanabe on 2020/05/19.
//  Copyright © 2020 Satoshi Watanabe. All rights reserved.
//

import UIKit

class RepoListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let apiService = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiService.fetchRepos().subscribe(
            onNext: { array in
                (self.tableView.dataSource as! RepoListDataSource).setData(repos: array)
                self.tableView.reloadData()
            },
            onError: { error in
                print(error)
            }
        )
    }
}


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
        self.title = "レポジトリリスト"
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let detailController = segue.destination as! RepoDetailViewController
            detailController.receiveText = sender as? String
        }
    }
}

extension RepoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let datasource = tableView.dataSource as! RepoListDataSource
        performSegue(withIdentifier: "detailSegue", sender: datasource.getData()[indexPath.row])
    }
}


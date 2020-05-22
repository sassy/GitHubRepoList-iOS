//
//  RepoListTableViewDelegate.swift
//  GitHubRepoList
//
//  Created by Satoshi Watanabe on 2020/05/22.
//  Copyright © 2020 Satoshi Watanabe. All rights reserved.
//

import UIKit

class RepoListTableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("tap")
    }
}

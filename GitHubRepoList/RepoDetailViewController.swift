//
//  RepoDetailViewController.swift
//  GitHubRepoList
//
//  Created by Satoshi Watanabe on 2020/05/23.
//  Copyright © 2020 Satoshi Watanabe. All rights reserved.
//

import UIKit

class RepoDetailViewController: UIViewController {
    
    @IBOutlet private weak var detailLabel: UILabel!
    var receiveText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "レポジトリ詳細"
        self.detailLabel.text = receiveText
    }
}

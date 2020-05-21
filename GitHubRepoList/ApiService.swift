//
//  ApiService.swift
//  GitHubRepoList
//
//  Created by Satoshi Watanabe on 2020/05/19.
//  Copyright © 2020 Satoshi Watanabe. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import RxSwift

struct ApiService {
    func fetchRepos(table: UITableView, datasource: RepoListDataSource) {
        AF.request("https://api.github.com/users/sassy/repos")
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let array: Array<String> = json.arrayValue.map { json in
                        json["full_name"].stringValue
                    }
                    datasource.setData(repos: array)
                    table.reloadData()  // TODO fix this reload
                case let .failure(error):
                    print(error)
                }
        }
    }
}

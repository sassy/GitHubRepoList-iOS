//
//  ApiService.swift
//  GitHubRepoList
//
//  Created by Satoshi Watanabe on 2020/05/19.
//  Copyright © 2020 Satoshi Watanabe. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RxSwift

struct ApiService {
    func fetchRepos() -> Observable<Array<String>> {
        return Observable.create { observer in
            AF.request("https://api.github.com/users/sassy/repos")
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        let array: Array<String> = json.arrayValue.map { json in
                            json["full_name"].stringValue
                        }
                        observer.onNext(array)
                    case let .failure(error):
                        observer.onError(error)
                    }
            }
            return Disposables.create()
        }
    }
}

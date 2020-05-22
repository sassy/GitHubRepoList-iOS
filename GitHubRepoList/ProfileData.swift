//
//  ProfileData.swift
//  GitHubRepoList
//
//  Created by Satoshi Watanabe on 2020/05/23.
//  Copyright © 2020 Satoshi Watanabe. All rights reserved.
//

import Foundation

struct ProfileData {
    var login: String
    var name: String
    var avatarUrl: String
    init(login:String, name: String, avatarUrl: String) {
        self.login = login
        self.name = name
        self.avatarUrl = avatarUrl
    }
}

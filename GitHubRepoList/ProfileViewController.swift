//
//  ProfileViewController.swift
//  GitHubRepoList
//
//  Created by Satoshi Watanabe on 2020/05/23.
//  Copyright © 2020 Satoshi Watanabe. All rights reserved.
//

import UIKit
import AlamofireImage


class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var loginLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    
    private let apiService = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apiService.fetchProfile().subscribe(
            onNext: { profile in
                print(profile.avatarUrl)
                self.profileImage.af.setImage(withURL: URL(string:profile.avatarUrl)!)
                self.loginLabel.text = profile.login
                self.nameLabel.text = profile.name
            }
        )
    }

}

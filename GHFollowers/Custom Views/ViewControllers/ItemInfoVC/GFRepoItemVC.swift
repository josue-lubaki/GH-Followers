//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Josue Lubaki on 2024-04-21.
//

import Foundation

class GFRepoItemVC : GFItemInfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgrounfColor: .systemPurple, title: "Github Profile")
    }
}

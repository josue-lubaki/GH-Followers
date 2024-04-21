//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Josue Lubaki on 2024-04-21.
//

import Foundation

class GFFollowerItemVC : GFItemInfoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgrounfColor: .systemGreen, title: "Github Followers")
    }
}

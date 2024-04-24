//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Josue Lubaki on 2024-04-21.
//

import Foundation

protocol GFFollowerItemVCDelegate : AnyObject {
    func didTapGetFollowers(for user : User)
}

class GFFollowerItemVC : GFItemInfoViewController {
    
    weak var delegate : GFFollowerItemVCDelegate!
    
    init(user : User, delegate : GFFollowerItemVCDelegate){
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgrounfColor: .systemGreen, title: "Github Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}

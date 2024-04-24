//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Josue Lubaki on 2024-04-21.
//

import Foundation

protocol GFRepoItemVCDelegate : AnyObject {
    func didTapGithubProfile(for user : User)
}

class GFRepoItemVC : GFItemInfoViewController {
    
    weak var delegate : GFRepoItemVCDelegate!
    
    
    init(user : User, delegate : GFRepoItemVCDelegate){
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
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(color: .systemPurple, title: "Github Profile", systemImageName: SFSymbols.person)
    }
    
    
    override func actionButtonTapped() {
        delegate.didTapGithubProfile(for: user)
    }
}

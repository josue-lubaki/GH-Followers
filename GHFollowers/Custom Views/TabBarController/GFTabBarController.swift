//
//  GFTabBarController.swift
//  GHFollowers
//
//  Created by Josue Lubaki on 2024-04-23.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers                 = [createSearchNavigationController(), createFavoritesNavigationController()]
    }
    

    private func createSearchNavigationController() -> UINavigationController {
        let searchVC        = SearchViewController()
        searchVC.title      = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    private func createFavoritesNavigationController() -> UINavigationController {
        let favoritesListVC         = FavoritesListViewController()
        favoritesListVC.title       = "Favorites"
        favoritesListVC.tabBarItem  = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesListVC)
    }
}

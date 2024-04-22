//
//  FavoritesListViewController.swift
//  GHFollowers
//
//  Created by Josue Lubaki on 2024-04-15.
//

import UIKit

class FavoritesListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let failure):
                break
            }
        }
    }


}

//
//  UITableView.swift
//  GHFollowers
//
//  Created by Josue Lubaki on 2024-04-24.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread(){
        DispatchQueue.main.async { self.reloadData() }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}

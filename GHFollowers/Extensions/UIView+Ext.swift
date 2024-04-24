//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Josue Lubaki on 2024-04-23.
//

import UIKit

extension UIView {
    func addSubViews(_ views : UIView...){
        for view in views { addSubview(view) }
    }
    
    func pinToRdge(of superview : UIView){
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
        ])
    }
}

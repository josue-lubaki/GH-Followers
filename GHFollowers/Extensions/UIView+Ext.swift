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
}

//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Josue Lubaki on 2024-04-17.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(title : String, message : String, buttonTitle : String) {
        DispatchQueue.main.async {
            let alertViewController = GFAlertViewController(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertViewController.modalPresentationStyle  = .overFullScreen
            alertViewController.modalTransitionStyle    = .crossDissolve
            self.present(alertViewController, animated: true)
        }
    }
}

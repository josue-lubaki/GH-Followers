//
//  GFButton.swift
//  GHFollowers
//
//  Created by Josue Lubaki on 2024-04-16.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor : UIColor, title : String){
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        layer.cornerRadius      = 10
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(backgrounfColor : UIColor, title : String){
        self.backgroundColor = backgrounfColor
        setTitle(title, for: .normal)
    }
}

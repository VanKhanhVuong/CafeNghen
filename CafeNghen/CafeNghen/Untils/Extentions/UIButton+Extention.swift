//
//  UIButton+Extention.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 05/10/2023.
//

import UIKit

extension UIButton {
    func configUIForButton(title: String, backgroundColor: UIColor, radius: Int) {
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(radius)
        
        if backgroundColor != .white {
            self.tintColor = .white
        }
    }
}

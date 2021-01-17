//
//  UIKit+Estension.swift
//  GlobalLogic Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 16/01/2021.
//

import UIKit

extension UIColor {
    static let customColorMain = UIColor(red: 38.0/255.0, green: 38.0/255.0, blue: 38.0/255.0, alpha: 1.0)
    static let customBackgroundColor = UIColor(red: 236.0/255.0, green: 239.0/255.0, blue: 241.0/255.0, alpha: 1.0)
}

extension UIView {
    func setViewShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        clipsToBounds = true
    }
}


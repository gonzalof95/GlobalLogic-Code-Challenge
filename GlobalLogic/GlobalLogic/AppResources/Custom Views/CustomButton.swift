//
//  CustomButton.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setButton() {
        setStyle()
        setViewShadow()
    }

    private func setStyle() {
        setTitleColor(.white, for: .normal)

        titleLabel?.font = UIFont(name: Fonts.robotoCondensed, size: 18)
    }

    func setColor(color: UIColor) {
        backgroundColor = color
    }

    func setImage(name: String) {
        setImage(UIImage(named: name), for: .normal)
    }
}

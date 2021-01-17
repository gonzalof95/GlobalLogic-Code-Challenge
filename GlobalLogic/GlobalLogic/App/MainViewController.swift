//
//  MainViewController.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 16/01/2021.
//

import UIKit

class MainViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    override func viewWillAppear(_ animated: Bool) {
        setNavBar(.customColorMain)
        setScreenTitle()
    }
}

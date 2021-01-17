//
//  BaseViewController.swift
//  GlobalLogic Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 16/01/2021.
//

import UIKit
import PureLayout
import Lottie

class BaseViewController: UIViewController {
    let animationView = AnimationView(forAutoLayout: ())

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setNavBar(_ color: UIColor) {
        navigationController?.navigationBar.backgroundColor = color
        navigationController?.navigationBar.barTintColor = color
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    func setScreenTitle(title: String = TitleConstants.mainScreenTitle) {
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: Fonts.robotoCondensed, size: 20) as Any]
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = title
    }
}

extension BaseViewController: BaseViewControllerProtocol {
    func pushNextViewController(_ viewController: BaseViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func showAnimation() {
        animationView.animation = Animation.named("loading")
        animationView.frame = view.bounds
        animationView.backgroundColor = .black
        animationView.contentMode = .center
        animationView.loopMode = .loop
        animationView.play()

        view.addSubview(animationView)

        animationView.autoSetDimensions(to: CGSize(width: 100, height: 100))
        animationView.autoCenterInSuperview()
    }

    func hideAnimation() {
        animationView.stop()
        animationView.removeFromSuperview()
    }
}


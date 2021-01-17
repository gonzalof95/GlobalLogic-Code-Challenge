//
//  BaseViewControllerProtocol.swift
//  GlobalLogic Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 16/01/2021.
//

protocol BaseViewControllerProtocol: AnyObject {
    func pushNextViewController(_ viewController: BaseViewController)
    func showAnimation()
    func hideAnimation()
}

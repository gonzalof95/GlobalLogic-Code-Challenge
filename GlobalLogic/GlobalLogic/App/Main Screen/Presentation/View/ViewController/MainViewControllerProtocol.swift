//
//  MainViewControllerProtocol.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import Foundation

protocol MainViewControllerProtocol: BaseViewControllerProtocol {
    func setupView(_ songs: [SongModel])
    func reloadTable(_ songs: [SongModel])
}

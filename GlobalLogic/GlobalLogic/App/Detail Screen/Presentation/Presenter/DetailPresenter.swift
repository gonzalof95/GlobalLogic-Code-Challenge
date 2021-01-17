//
//  DetailPresenter.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import Foundation
import RxSwift

class DetailPresenter {
    weak var delegate: DetailViewControllerProtocol?
    private let disposebag = DisposeBag()
    let song: SongModel

    init(song: SongModel) {
        self.song = song
    }

    func viewLoaded() {
        delegate?.setupView(song)
    }
}

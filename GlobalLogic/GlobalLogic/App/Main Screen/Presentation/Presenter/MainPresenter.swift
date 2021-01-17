//
//  MainPresenter.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import RxSwift

class MainPresenter {
    weak var delegate: MainViewControllerProtocol?
    private let disposebag = DisposeBag()
    private let service: SongsServiceProtocol
    var songsList: [SongModel] = []
    var apiCalled = false
    var timesRecalled = 0

    init(service: SongsServiceProtocol) {
        self.service = service
    }

    func executeGet(offset: Int = 0, isReloadingData: Bool = false, search: String) {
        if !isReloadingData {
            delegate?.showAnimation()
        }
        service.execute(offset, search)
            .subscribe(onNext: { [weak self] response in
                self?.songsList = response.results
                print(self?.songsList)
                DispatchQueue.main.async {
                    self?.delegate?.hideAnimation()
                    self?.successGet(isReloadingData)
                }
            }, onError: { error in
                debugPrint(error)
            })
            .disposed(by: disposebag)
    }

    private func successGet(_ isReloading: Bool) {
        if !isReloading {
            delegate?.setupView(songsList)
        } else {
            delegate?.reloadTable(songsList)
        }
    }

    func requestMoreData(_ isAppiCalled: Bool, _ timesRecalled : Int, _ isReloadingData: Bool, _ search: String) {
        if !isAppiCalled {
            apiCalled = true
            self.timesRecalled += 1
            executeGet(offset: self.timesRecalled * 20, isReloadingData: isReloadingData, search: search)
        }
    }

    func rowTapped(song: SongModel) {
        let presenter = DetailPresenter(song: song)
        delegate?.pushNextViewController(DetailViewController(with: presenter, songData: song))
    }
}

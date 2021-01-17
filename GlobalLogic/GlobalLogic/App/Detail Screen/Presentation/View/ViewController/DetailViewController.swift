//
//  DetailViewController.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import UIKit
import PureLayout

class DetailViewController: BaseViewController {
    var presenter: DetailPresenter?
    var songData: SongModel
    var detailView: DetailView?

    init(with presenter: DetailPresenter, songData: SongModel) {
        self.songData = songData
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter?.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        presenter?.viewLoaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        setNavBar(.customColorMain)
        setScreenTitle()
    }

    private func setupViewValues(song: SongModel) {
        songData = song

        self.detailView = DetailView()
        guard let strongCustomView = detailView else { return }

        strongCustomView.configure(song: song)
        view.addSubview(strongCustomView)
        detailView?.autoPinEdgesToSuperviewEdges()
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    func setupView(_ song: SongModel) {
        setupViewValues(song: song)
    }
}
